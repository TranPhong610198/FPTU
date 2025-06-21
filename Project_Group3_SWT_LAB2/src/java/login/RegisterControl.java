/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package login;

import DAO.TokenDAO;
import DAO.UserDAO;
import entity.Token;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entity.User;
import java.time.LocalDateTime;
import java.util.regex.Pattern;
import utils.Email;
import utils.MaHoa;

/**
 *
 * @author nguye
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String re_pass = request.getParameter("repassword");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");

            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("gender", gender);

            // Validate input
            if (isNullOrEmpty(fullname) || isNullOrEmpty(username)
                    || isNullOrEmpty(password) || isNullOrEmpty(re_pass)
                    || isNullOrEmpty(email) || isNullOrEmpty(phone)
                    || isNullOrEmpty(gender)) {
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Validate fullname
            if (!Pattern.matches("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$", fullname) || fullname.length()>25) {
                request.setAttribute("error", "Vui lòng nhập họ và tên hợp lệ.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Validate username
            if (!Pattern.matches("^[a-zA-Z0-9]{4,20}$", username)) {
                request.setAttribute("error", "Tên người dùng phải dài từ 4-20 ký tự và không được chứa ký tự đặc biệt.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Validate password match
            if (!password.equals(re_pass)) {
                request.setAttribute("error", "Mật khẩu không khớp!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Validate phone
            if (!Pattern.matches("^(\\+84|0)[1-9][0-9]{8,9}$", phone)) {
                request.setAttribute("error", "Vui lòng nhập số điện thoại Việt Nam hợp lệ.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Hash password
            String hashedPassword = MaHoa.toBcrypt(password);

            UserDAO userDao = new UserDAO();
            TokenDAO tokenDao = new TokenDAO();
            Email emailUtil = new Email();

            User checkExistUsername = userDao.checkExistUsername(username);
            if (checkExistUsername != null) {
                request.setAttribute("error", "Tên người dùng đã tồn tại!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            User checkExistEmail = userDao.checkExistEmail(email);
            if (checkExistEmail != null) {
                request.setAttribute("error", "Email đã được đăng ký!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            User checkExistPhone = userDao.checkExistPhone(phone);
            if (checkExistPhone != null) {
                request.setAttribute("error", "Số điện thoại đã được đăng ký!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // set đối tượng mới ở trang thái pending
            User newUser = new User(username, email, hashedPassword, fullname, gender, phone);
            newUser.setStatus("pending");

            // insert new user và lấy userID
            int userId = userDao.insertUserWithPendingStatus(newUser);

            if (userId == -1) {
                request.setAttribute("error", "Không tạo được tài khoản người dùng.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // tạo token
            String token = emailUtil.generateToken();
            LocalDateTime expiryTime = emailUtil.expireDateTime();

            Token verificationToken = new Token(userId, false, token, expiryTime);
            tokenDao.insertTokenForget(verificationToken);

            // Send email
            boolean emailSent = emailUtil.sendEmail(newUser, token);

            if (!emailSent) {
                request.setAttribute("error", "Không gửi được email xác thực. Vui lòng thử lại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            request.setAttribute("mess", "Đăng ký thành công. Vui lòng kiểm tra email để xác minh tài khoản của bạn.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đăng ký không thành công. Vui lòng thử lại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
