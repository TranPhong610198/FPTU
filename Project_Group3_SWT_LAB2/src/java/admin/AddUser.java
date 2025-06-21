package admin;

import DAO.UserDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;
import utils.BCrypt;

@WebServlet(name = "UserAddServlet", urlPatterns = "/admin/addUser")
public class AddUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
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
            String role = request.getParameter("role");
 
            System.out.println("fullname: " + fullname);
            System.out.println("username: " + username);
            System.out.println("password: " + password);
            System.out.println("re_pass: " + re_pass);
            System.out.println("email: " + email);
            System.out.println("phone: " + phone);
            System.out.println("gender: " + gender);
            System.out.println("role: " + role);

            request.setAttribute("fullname", fullname);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("gender", gender);
            request.setAttribute("role", role);

            // Validate input
            if (isNullOrEmpty(fullname) || isNullOrEmpty(username)
                    || isNullOrEmpty(password) || isNullOrEmpty(re_pass)
                    || isNullOrEmpty(email) || isNullOrEmpty(phone)
                    || isNullOrEmpty(gender) || isNullOrEmpty(role)) {
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Validate fullname
            if (!Pattern.matches("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$", fullname)) {
                request.setAttribute("error", "Vui lòng nhập họ và tên hợp lệ.");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Validate username
            if (!Pattern.matches("^[a-zA-Z0-9]{4,20}$", username)) {
                request.setAttribute("error", "Tên người dùng phải dài từ 4-20 ký tự và không được chứa ký tự đặc biệt.");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Validate password match
            if (!password.equals(re_pass)) {
                request.setAttribute("error", "Mật khẩu không khớp!");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Validate phone
            if (!Pattern.matches("^(\\+84|0)[1-9][0-9]{8,9}$", phone)) {
                request.setAttribute("error", "Vui lòng nhập số điện thoại Việt Nam hợp lệ.");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            UserDAO userDao = new UserDAO();

            User checkExistUsername = userDao.checkExistUsername(username);
            if (checkExistUsername != null) {
                request.setAttribute("error", "Tên người dùng đã tồn tại!");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }
            User checkExistEmail = userDao.checkExistEmail(email);
            if (checkExistEmail != null) {
                request.setAttribute("error", "Email đã được đăng ký!");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }
            User checkExistPhone = userDao.checkExistPhone(phone);
            if (checkExistPhone != null) {
                request.setAttribute("error", "Số điện thoại đã được đăng ký!");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Create new User object
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt()));
            newUser.setEmail(email);
            newUser.setFullName(fullname);
            newUser.setGender(gender);
            newUser.setMobile(phone);
            newUser.setRole(role);
            newUser.setStatus("active");

            // Add user to database
            boolean success = userDao.createUser(newUser);

            if (success) {
                // Redirect to user list with success message
                response.sendRedirect(request.getContextPath() + "/admin/userlists");
            } else {
                request.setAttribute("error", "Failed to create user");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while creating the user");
            request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
        }
    }
}