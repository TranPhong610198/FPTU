/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package profile;

import DAO.TokenDAO;
import DAO.UserDAO;
import entity.Token;
import entity.User;
import java.io.IOException;
import utils.Email;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import utils.BCrypt;

/**
 *
 * @author thanh
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changepassword"})
public class ChangePassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession(false);

    if (session == null || session.getAttribute("acc") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Lấy user từ session
    User user = (User) session.getAttribute("acc");
    
    // Kiểm tra xem tài khoản có phải đăng nhập bằng Google không
    if (user.getPasswordHash() != null && user.getPasswordHash().startsWith("accGoogle")) {
        // Xử lý cho tài khoản Google - gửi email reset password
        UserDAO userDao = new UserDAO();
        TokenDAO tokenDao = new TokenDAO();
        Email emailUtil = new Email();
        
        // Tạo token và thời gian hết hạn (30 phút)
        String token = emailUtil.generateToken();
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(30);

        Token resetToken = new Token(user.getId(), false, token, expiryTime);
        tokenDao.insertTokenForget(resetToken);

        // Gửi email xác nhận
        boolean isSent = emailUtil.sendEmailReset(user, token);

        if (isSent) {
            request.setAttribute("mess", "Hệ thống đã gửi email xác nhận, vui lòng kiểm tra hộp thư.");
        } else {
            request.setAttribute("mess", "Không thể gửi email, vui lòng thử lại.");
        }

        request.getRequestDispatcher("requestEmail.jsp").forward(request, response);
    } else {
        // Xử lý cho tài khoản thông thường - hiển thị form đổi mật khẩu
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
    }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
    User user = (User) session.getAttribute("acc");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Kiểm tra xem có phải tài khoản Google không
    if (user.getPasswordHash() != null && user.getPasswordHash().startsWith("accGoogle")) {
        request.setAttribute("error", "Tài khoản Google không thể thay đổi mật khẩu trực tiếp. Vui lòng sử dụng chức năng quên mật khẩu.");
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        return;
    }

    String action = request.getParameter("action");

    if ("change".equals(action)) {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDAO userDAO = new UserDAO();

        if (!BCrypt.checkpw(currentPassword, user.getPasswordHash())) {
            request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
        } else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu mới và xác nhận không khớp!");
        } else {
            boolean updated = userDAO.updatePassword(user.getId(), newPassword);
            if (updated) {
                request.setAttribute("success", "Đổi mật khẩu thành công!");
                user = userDAO.getUserById(user.getId());
                session.setAttribute("acc", user);
            } else {
                request.setAttribute("error", "Đã có lỗi xảy ra, vui lòng thử lại!");
            }
        }
    } else {
        request.setAttribute("error", "Hành động không hợp lệ.");
    }
    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
