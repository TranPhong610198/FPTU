/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package login;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.TokenDAO;
import DAO.UserDAO;
import entity.Token;
import entity.User;
import utils.MaHoa;
import java.io.IOException;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tphon
 */
@WebServlet(name = "resetPassword", urlPatterns = {"/resetpassword"})
public class resetPassword extends HttpServlet {

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
            out.println("<title>Servlet resetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPassword at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String token = request.getParameter("token");
//        System.out.println(token);
        request.setAttribute("token", token);

        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);

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
//        processRequest(request, response);

        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("mess", "Mật khẩu xác nhận không khớp.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        TokenDAO tokenDao = new TokenDAO();
        UserDAO userDao = new UserDAO();

        Token resetToken = tokenDao.getTokenPassword(token);

        if (resetToken == null || resetToken.isIsUsed() || LocalDateTime.now().isAfter(resetToken.getExpiryTime())) {
            request.setAttribute("mess", "Mã xác nhận không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        // Cập nhật mật khẩu mới
//        String hashedPassword = MaHoa.toBcrypt(newPassword);
        boolean updated = userDao.updatePassword(resetToken.getUserId(), newPassword);

        if (updated) {
            resetToken.setIsUsed(true);
            tokenDao.updateStatus(resetToken);
            request.setAttribute("mess", "Mật khẩu đã được đặt lại thành công. Hãy đăng nhập.");
        } else {
            request.setAttribute("mess", "Không thể cập nhật mật khẩu, thử lại sau.");
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);

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
