package login;

import DAO.UserDAO;
import DAO.TokenDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import entity.User;
import entity.Token;
import java.time.LocalDateTime;
import org.apache.http.client.fluent.Request;
import utils.Email;

/**
 *
 * @author nguye
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        if (code != null && !code.isEmpty()) {
            try {
                // Lấy Google info
                String accessToken = GoogleLogin.getToken(code);
                String userInfoJson = Request.Get(ClientSecret.GOOGLE_LINK_GET_USER_INFO + accessToken)
                        .execute().returnContent().asString();

                JsonObject userInfo = new Gson().fromJson(userInfoJson, JsonObject.class);

                // Trích xuất info user từ response
                String googleId = userInfo.get("id").getAsString();
                String email = userInfo.get("email").getAsString();
                String fullName = userInfo.get("name").getAsString();
                String picture = userInfo.get("picture").getAsString();

                UserDAO userDao = new UserDAO();
                TokenDAO tokenDao = new TokenDAO();
                User existingUser = userDao.checkExistEmail(email);

                if (existingUser != null) {
                    if ("inactive".equals(existingUser.getStatus())) {
                        request.setAttribute("error", "Tài khoản của bạn đã bị chặn.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        return;
                    } else if ("pending".equals(existingUser.getStatus())) {
                        userDao.activateUser(existingUser.getId());
                        tokenDao.deleteUserTokens(existingUser.getId());
                    }

                    HttpSession session = request.getSession();
                    session.setAttribute("acc", existingUser);
                    session.setAttribute("userID", existingUser.getId());
                    // Kiểm tra có lưu URL trước đó không
                    String redirectURL = (String) session.getAttribute("redirectAfterLogin");
                    if (redirectURL != null) {
                        session.removeAttribute("redirectAfterLogin"); // Xóa session lưu URL
                        response.sendRedirect(redirectURL); // Quay lại trang trước đó
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home"); // Nếu không có, về trang chủ
                    }
//                    response.sendRedirect(request.getContextPath() + "/home");
                    return;
                } else {
                    userDao.insertGoogleUser(googleId, email, fullName, picture);
                    existingUser = userDao.checkExistEmail(email);
                }

                HttpSession session = request.getSession();
                session.setAttribute("acc", existingUser);
                session.setAttribute("userID", existingUser.getId());

                // Kiểm tra có lưu URL trước đó không
                String redirectURL = (String) session.getAttribute("redirectAfterLogin");
                if (redirectURL != null) {
                    session.removeAttribute("redirectAfterLogin"); // Xóa session lưu URL
                    response.sendRedirect(redirectURL); // Quay lại trang trước đó
                } else {
                    response.sendRedirect(request.getContextPath() + "/home"); // Nếu không có, về trang chủ
                }
//                response.sendRedirect(request.getContextPath() + "/home");

                return;

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Đăng nhập Google thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.getRequestDispatcher("login.jsp").forward(request, response);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String loginId = request.getParameter("loginId"); // Thay vì "username", dùng "loginId" để đại diện cho cả username và email
        String password = request.getParameter("password");

        UserDAO userDao = new UserDAO();
        TokenDAO tokenDao = new TokenDAO();
        User account = null;

        // Kiểm tra xem loginId là email hay username dựa trên ký tự "@"
        if (loginId.contains("@")) {
            account = userDao.loginByEmail(loginId, password);
        } else {
            account = userDao.loginByUsername(loginId, password);
        }

        if (account == null) {
            request.setAttribute("error", "Tên đăng nhập/Email hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if ("inactive".equals(account.getStatus())) {
                request.setAttribute("error", "Tài khoản của bạn đã bị chặn.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            } else if ("pending".equals(account.getStatus())) {
                // check token hiện tại của user
                Token currentToken = tokenDao.getTokenByUserId(account.getId());

                // token còn hạn
                if (currentToken != null && LocalDateTime.now().isBefore(currentToken.getExpiryTime())) {
                    request.setAttribute("mess", "Email xác thực đã được gửi. Vui lòng kiểm tra email của bạn.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                // Nếu không có token hoặc token đã hết hạn, tạo token mới
                Email emailUtil = new Email();
                String token = emailUtil.generateToken();
                LocalDateTime expiryTime = emailUtil.expireDateTime();

                Token verificationToken = new Token(account.getId(), false, token, expiryTime);
                tokenDao.insertTokenForget(verificationToken);

                boolean emailSent = emailUtil.sendEmail(account, token);

                if (!emailSent) {
                    request.setAttribute("error", "Không thể gửi email xác minh. Vui lòng thử lại sau.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                request.setAttribute("error", "Email của bạn chưa được xác thực. Một email xác thực mới đã được gửi đến bạn.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("acc", account);
            session.setAttribute("userID", account.getId());
            // Kiểm tra có lưu URL trước đó không
            String redirectURL = (String) session.getAttribute("redirectAfterLogin");
            if (redirectURL != null) {
                session.removeAttribute("redirectAfterLogin"); // Xóa session lưu URL
                response.sendRedirect(redirectURL); // Quay lại trang trước đó
            } else {
                response.sendRedirect(request.getContextPath() + "/home"); // Nếu không có, về trang chủ
            }
        }
    }
}
