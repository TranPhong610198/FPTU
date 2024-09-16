/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tphon
 */
@WebServlet(name = "Bai6", urlPatterns = {"/bai6"})
public class Bai6 extends HttpServlet {

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
            out.println("<title>Servlet Bai6</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Bai6 at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        //trong Servlet
        PrintWriter out = response.getWriter();
        String n1_raw = request.getParameter("num1");
        String n2_raw = request.getParameter("num2");
        String op = request.getParameter("op");
        op = (op == null) ? "+" : op;
        double n1, n2;

        try {
            n1 = Double.parseDouble(n1_raw);
            n2 = Double.parseDouble(n2_raw);
            String s = tinh(n1, n2, op);
            out.println("<h1>" + s + "</h1>");
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private String tinh(double x, double y, String o) {
        String s = "";
        switch (o) {
            case "+":
                s = "tong:" + (x + y);
                break;
            case "-":
                s = "hieu:" + (x - y);
                break;
            case "x":
                s = "tich:" + (x * y);
                break;
            case ":":
                if (y == 0) {
                    s = "khong chia cho 0";
                } else {
                    s = "thuong:" + (x / y);
                }
                break;
        }
        return s;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
