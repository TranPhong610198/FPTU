package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UserDetailServlet", urlPatterns = {"/admin/userdetail/*"})
public class UserDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        String action = pathParts[1]; // view, edit, delete, etc.

        switch (action) {
            case "view":
                viewUserDetail(request, response);
                break;
            case "edit":
                if (request.getMethod().equalsIgnoreCase("GET")) {
                    showEditForm(request, response);
                }
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/userlists");
                break;
        }
    }

    private void viewUserDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String userId = request.getParameter("id");
            if (userId == null || userId.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/userlists");
                return;
            }

            int id = Integer.parseInt(userId);
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(id);
            request.setAttribute("avatar", user.getAvatar());

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/admin/userlists");
                return;
            }

            request.setAttribute("user", user);
            request.getRequestDispatcher("/admin/userdetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(userId);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("/admin/userdetail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/userlists");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDAO userDAO = new UserDAO();
            
            if (userDAO.deleteUser(userId)) {
                // Thêm thông báo thành công nếu cần
                request.getSession().setAttribute("successMessage", "Xóa người dùng thành công!");
            } else {
                request.getSession().setAttribute("errorMessage", "Không thể xóa người dùng!");
            }
            
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        String action = pathParts[1];

        if ("edit".equals(action)) {
            updateUser(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            int userId = Integer.parseInt(request.getParameter("id"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            // Tạo đối tượng User với thông tin mới
            User user = new User();
            user.setId(userId);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setMobile(mobile);
            user.setGender(gender);
            user.setRole(role);
            user.setStatus(status);

            // Cập nhật user trong database
            UserDAO userDAO = new UserDAO();
            if (userDAO.updateUserInfo(user)) {
                request.getSession().setAttribute("successMessage", "Cập nhật thông tin thành công!");
                response.sendRedirect(request.getContextPath() + "/admin/userlists");
            } else {
                request.getSession().setAttribute("errorMessage", "Cập nhật thông tin thất bại!");
                response.sendRedirect(request.getContextPath() + "/admin/userdetail/edit?id=" + userId);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/userlists");
        }
    }
}
