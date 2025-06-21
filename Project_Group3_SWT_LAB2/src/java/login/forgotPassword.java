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
import utils.Email;
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
@WebServlet(name = "forgotPassword", urlPatterns = {"/forgotpassword"})
public class forgotPassword extends HttpServlet {

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
            out.println("<title>Servlet forgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forgotPassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("requestEmail.jsp").forward(request, response);
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
        String email = request.getParameter("email");

        UserDAO userDao = new UserDAO();
        TokenDAO tokenDao = new TokenDAO();
        Email emailUtil = new Email();

        User user = userDao.checkExistEmail(email);

        if (user == null) {
            request.setAttribute("mess", "Email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("requestEmail.jsp").forward(request, response);
            return;
        } else if (user.getStatus().equals("pending")){
            request.setAttribute("mess", "Tài khoản chưa được xác thực.");
            request.getRequestDispatcher("requestEmail.jsp").forward(request, response);
            return;
        }

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
