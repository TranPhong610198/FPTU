package login;

import DAO.TokenDAO;
import DAO.UserDAO;
import entity.Token;
import entity.User;
import utils.Email;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

@WebServlet(name = "VerifyTokenControl", urlPatterns = {"/verify"})
public class VerifyTokenControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        
        if (token == null || token.isEmpty()) {
            request.setAttribute("error", "Mã xác thực không hợp lệ.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        TokenDAO tokenDao = new TokenDAO();
        UserDAO userDao = new UserDAO();
        Email emailUtil = new Email();

        Token storedToken = tokenDao.getTokenPassword(token);

        if (storedToken == null) {
            request.setAttribute("error", "Mã xác thực không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (storedToken.isIsUsed()) {
            request.setAttribute("error", "Mã xác thực đã được sử dụng. Vui lòng đăng nhập.");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }

        if (LocalDateTime.now().isAfter(storedToken.getExpiryTime())) {
            User user = userDao.getUserById(storedToken.getUserId());
            
            if (user != null) {
                String newToken = emailUtil.generateToken();
                LocalDateTime newExpiryTime = emailUtil.expireDateTime();
                
                Token newVerificationToken = new Token(user.getId(), false, newToken, newExpiryTime);
                tokenDao.insertTokenForget(newVerificationToken);
                
                boolean emailSent = emailUtil.sendEmail(user, newToken);
                
                if (emailSent) {
                    request.setAttribute("mess", "Mã xác thực trước đó đã hết hạn. Một email xác thực mới đã được gửi. Vui lòng kiểm tra email.");
                } else {
                    request.setAttribute("error", "Không gửi được email xác thực mới. Vui lòng liên hệ bộ phận hỗ trợ.");
                }
            } else {
                request.setAttribute("error", "Không tìm thấy người dùng cho mã xác thực này.");
            }
            
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }

        // active tài khoản
        storedToken.setIsUsed(true);
        tokenDao.updateStatus(storedToken);
        
        boolean activated = userDao.activateUser(storedToken.getUserId());

        if (activated) {
            request.setAttribute("mess", "Tài khoản đã được xác thực thành công. Bây giờ bạn có thể đăng nhập.");
        } else {
            request.setAttribute("mess", "Không xác thực được tài khoản.");
        }

        request.getRequestDispatcher("login").forward(request, response);
    }
}