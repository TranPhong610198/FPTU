/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.sun.source.tree.BreakTree;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author tphon
 */
@WebServlet(urlPatterns = {"/myExam"})
public class myExamServlet extends HttpServlet {

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
            out.println("<title>Servlet myExamServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet myExamServlet at " + request.getContextPath() + "</h1>");
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
    ArrayList<Players> list = new ArrayList<Players>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String code_raw = request.getParameter("code");
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String salary_raw = request.getParameter("salary");
        int code, salary;
        String error = "";

        try {
            code = Integer.parseInt(code_raw);
            salary = Integer.parseInt(salary_raw);
            if (salary_raw.isEmpty() || salary_raw == null || salary < 0) {
                error = "You must input an integer > 0 for salary";
            }
            for (Players temp : list) {
                if (temp.getCode() == code) {
                    error = "Code existed";
                    break;
                }
            }
            if (error.equals("")){
                list.add(new Players(code, salary, name, position));
            }
            request.setAttribute("list", list);
            request.setAttribute("error", error);
            request.getRequestDispatcher("myexam.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("");
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

}