/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.User;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author tphon
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/register"})
public class registerServlet extends HttpServlet {

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
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String errPass = "", errMail = "", errUser = "", success = "";
        boolean check = true;
        try {
            if (!pass1.equals(pass2)) {
                errPass = "Password confirm not match!!!";
                check = false;
            }
            if (!isValidUsername(username)){
                errUser = "invalid";
                check = false;
            }
            UserDAO ud = new UserDAO();
            List<User> allUser = ud.getAll();
            for (User temp : allUser) {
                if (temp.getEmail().equals(email)) {
                    errMail = "The email was existed!!!";
                    check = false;
                }
                if (temp.getUsername().equals(username)) {
                    errUser = "The username was exsited!!!";
                    check = false;
                }
            }
            System.out.println(username);
            request.setAttribute("errMail", errMail);
            request.setAttribute("errPass", errPass);
            request.setAttribute("errUser", errUser);
            if (check) {
                User result = new User(username, pass2, email);
                ud.register(result);
                success = "Register account successful!!!";
                request.setAttribute("success", success);
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
        }
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

    public static boolean isValidUsername(String username) {
        // Kiểm tra nếu username là null hoặc độ dài không nằm trong khoảng 6-20
        if (username == null || username.length() < 6 || username.length() > 20) {
            return false;
        }

        // Sử dụng biểu thức chính quy (regex) để kiểm tra các ký tự
        String regex = "^[a-zA-Z0-9](?!.*__)[a-zA-Z0-9_]{4,18}[a-zA-Z0-9]$";

        return username.matches(regex);
    }

}
