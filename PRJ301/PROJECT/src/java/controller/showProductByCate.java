/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author tphon
 */
@WebServlet(name = "showProductByCate", urlPatterns = {"/showCate"})
public class showProductByCate extends HttpServlet {

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
            out.println("<title>Servlet showProductByCate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet showProductByCate at " + request.getContextPath() + "</h1>");
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
        String productId_raw = request.getParameter("productId");
        String category_raw = request.getParameter("cate");
        int categoryId = -1, productId = -1;
        try {
            categoryId = Integer.parseInt(category_raw);
            productId = Integer.parseInt(productId_raw);
        } catch (Exception e) {
            System.out.println(e);
        }
        ProductDAO pd = new ProductDAO();
        int pageSize = 8; // Số sản phẩm trên mỗi trang
        int page = 1; // Trang hiện tại, mặc định là 1
        // Nếu có tham số 'page' trong request, cập nhật giá trị của trang hiện tại
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        // Tính offset dựa trên trang hiện tại
        int offset = (page - 1) * pageSize;
        // Tính tổng số trang
        int totalProducts = pd.getTotalProducts("and category_id=" + categoryId);
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        List<Product> list = pd.getProductsByCate(categoryId, pageSize, offset);
        Product temp = pd.getProductByID(productId);
        String cateName = "";
        for (Category cate : temp.getListCategory()) {
            if (cate.getCategoryId() == categoryId) {
                cateName = cate.getCategoryName();
            }
        }
        Product outstandP = pd.getOutstandProduct();
        request.setAttribute("outstandP", outstandP);

        List<Product> top5new = pd.getTop5New();
        request.setAttribute("top5new", top5new);

        List<Product> top5sale = pd.getTop5Sale();
        request.setAttribute("top5sale", top5sale);
        
        request.setAttribute("nameOfList", cateName);
        request.setAttribute("typeServlet", "showCate?cate=" + categoryId + "&productId=" + productId + "&");
        request.setAttribute("product", temp);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("data", list);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
