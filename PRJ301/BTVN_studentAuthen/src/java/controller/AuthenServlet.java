/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Student;

/**
 *
 * @author tphon
 */
@WebServlet(name = "AuthenServlet", urlPatterns = {"/authen"})
public class AuthenServlet extends HttpServlet {

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
            out.println("<title>Servlet AuthenServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthenServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Admin a = (Admin) session.getAttribute("account");
        PrintWriter out = response.getWriter();
        if (a == null) {
            out.print("access dined!!!");
        } else {
            if (action.equals("add")) {
                response.sendRedirect("addNew.jsp");
            }
            if (action.equals("delete")) {
                String id = request.getParameter("id");
                try {

//            PrintWriter out = response.getWriter();
//            out.print("HELLLL NOOO!!!");
                    DAO d = new DAO();
                    d.delete(id);
                    response.sendRedirect("list");
                } catch (IOException | NumberFormatException e) {
                    System.out.println(e);
                }
            }
            if (action.equals("update")) {
                String id = request.getParameter("id");
                try {
                    DAO d = new DAO();
                    Student c = d.getStudentByID(id);
                    request.setAttribute("category", c);
                    request.getRequestDispatcher("update.jsp").forward(request, response);
                } catch (ServletException | IOException e) {
                    System.out.println(e);
                }
            }
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
        processRequest(request, response);
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
