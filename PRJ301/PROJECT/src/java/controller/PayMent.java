/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;
import model.OrderItem;

/**
 *
 * @author tphon
 */
@WebServlet(name = "PayMent", urlPatterns = {"/payment"})
public class PayMent extends HttpServlet {

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
            out.println("<title>Servlet PayMent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayMent at " + request.getContextPath() + "</h1>");
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
        String orderId_raw = request.getParameter("orderId");
        String total_raw = request.getParameter("total");
        double total = -1;
        int orderId = -1;
        try {
            total = Double.parseDouble(total_raw);
            orderId = Integer.parseInt(orderId_raw);
        } catch (Exception e) {
        }
        request.setAttribute("total", total);
        request.setAttribute("orderId", orderId);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
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
        String orderId_raw = request.getParameter("orderId");
        String totalAmount_raw = request.getParameter("totalAmount");
        int orderId = -1;
        double totalAmount = -1;
        try {
            orderId = Integer.parseInt(orderId_raw);
            totalAmount = Double.parseDouble(totalAmount_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        OrderDAO od = new OrderDAO();
        ProductDAO pd = new ProductDAO();
        List<OrderItem> items = od.getListItemInOrder(orderId);
        for (OrderItem temp : items) {
            int stock = pd.getProductByID(temp.getProductId()).getStock();

            if (od.checkProductIdInStat(temp.getProductId()) != null) {
                od.updateSatistic(
                        temp.getProductId(),
                        temp.getQuantity(),
                        totalAmount,
                        od.checkProductIdInStat(temp.getProductId()),
                        stock,
                        orderId);
            } else {
                od.addSatistic(
                        temp.getProductId(),
                        temp.getQuantity(),
                        totalAmount,
                        stock,
                        orderId);
            }
           
        }
         response.sendRedirect("home");
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
