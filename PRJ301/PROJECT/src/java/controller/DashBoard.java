/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author tphon
 */
@WebServlet(name = "DashBoard", urlPatterns = {"/admin"})
public class DashBoard extends HttpServlet {

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
            out.println("<title>Servlet DashBoard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashBoard at " + request.getContextPath() + "</h1>");
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
        UserDAO ud = new UserDAO();
        OrderDAO od = new OrderDAO();
        ProductDAO pd = new ProductDAO();
//Thống kê tổng doanh thu, top người dùng mua hàng, top sản phẩm
        double totalRevenue = od.getTotalRevenue();
        request.setAttribute("totalRevenue", totalRevenue);

        List<User> top3Spent = od.getTopSpendingUsers();
        request.setAttribute("top3spent", top3Spent);

        List<Product> top5Sale = pd.getTop5Sale();
        request.setAttribute("top5sale", top5Sale);
// ____________________________________________________________________________________________        
// Chart thống kê doanh thu ___________________________________________________________________
        List<String> dates = od.getRevenueDates();
        List<Double> revenues = od.getRevenueAmounts();

        StringBuilder datesJson = new StringBuilder("[");
        for (int i = 0; i < dates.size(); i++) {
            datesJson.append("\"").append(dates.get(i)).append("\"");
            if (i < dates.size() - 1) {
                datesJson.append(",");
            }
        }
        datesJson.append("]");

        StringBuilder revenuesJson = new StringBuilder("[");
        for (int i = 0; i < revenues.size(); i++) {
            revenuesJson.append(revenues.get(i));
            if (i < revenues.size() - 1) {
                revenuesJson.append(",");
            }
        }
        revenuesJson.append("]");

        request.setAttribute("datesJson", datesJson.toString());
        request.setAttribute("revenuesJson", revenuesJson.toString());
//_____________________________________________________________________________________________
// Thống kê đơn hàng theo trạng thái (Processing, Completed, Cancelled)
        // Lấy dữ liệu thống kê số lượng đơn hàng theo trạng thái
        Map<String, Integer> statusCounts = od.getOrderStatusCounts();

        StringBuilder labelsJson = new StringBuilder("[");
        StringBuilder countsJson = new StringBuilder("[");

        int index = 0;
        for (Map.Entry<String, Integer> entry : statusCounts.entrySet()) {
            labelsJson.append("\"").append(entry.getKey()).append("\"");
            countsJson.append(entry.getValue());
            if (index < statusCounts.size() - 1) {
                labelsJson.append(",");
                countsJson.append(",");
            }
            index++;
        }
        labelsJson.append("]");
        countsJson.append("]");

        request.setAttribute("labelsJson", labelsJson.toString());
        request.setAttribute("countsJson", countsJson.toString());
// ____________________________________________________________________________________________
// Danh sách đơn hàng__________________________________________________________________________
        List<User> listUser = ud.getAll();
        List<Order> listOrder = od.getAllOrder(-1);

        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listUser", listUser);
//_____________________________________________________________________________________________
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
