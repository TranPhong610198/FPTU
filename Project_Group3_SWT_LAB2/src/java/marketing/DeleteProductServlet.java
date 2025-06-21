/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.CartDAO;
import DAO.ProductDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author tphon
 */
@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/marketing/deleteproduct"})
public class DeleteProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();
    private CartDAO cartDAO = new CartDAO();

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
            out.println("<title>Servlet DeleteProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProductServlet at " + request.getContextPath() + "</h1>");
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
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String uploadPath = getServletContext().getRealPath("/uploads/productImages");
            //kiểm tra đơn
            if (productDAO.hasProcessOrders(productId)) {
                response.sendRedirect("productlist?alert=ER1_OP");
                return;
            }
            //kiểm tra kho
            if (productDAO.hasStock(productId)) {
                response.sendRedirect("productlist?alert=ER2_HS");
                return;
            }

            //kiểm tra giỏ
            if (productDAO.hasProductInCart(productId)) {
                if (!cartDAO.deleteProductFromCart(productId)) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi khi xóa sản phẩm trong giỏ hàng");
                    return;
                }
            }

            //kiểm tra combo -> lấy danh sách sản phẩm thuộc combo -> chuyển is Id sang sản phẩm cùng combo gần nhất
            Product tempP = productDAO.getProductById(productId);
            if (tempP.isIsCombo()) {
                List<Product> comboList = productDAO.getComboProduct(tempP.getComboGroupId());
                if (comboList.size() >= 2) {
                    int upProductId = comboList.get(comboList.size() - 2).getId();
                    productDAO.setIsComboByProductId(upProductId, true);
                }
            }

            if (productDAO.deleteProduct(productId, uploadPath)) {
                response.sendRedirect("productlist?alert=SSD");
            } else {
//                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi khi xóa sản phẩm");
                response.sendRedirect("productlist?alert=ERR");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error/error.jsp");
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
