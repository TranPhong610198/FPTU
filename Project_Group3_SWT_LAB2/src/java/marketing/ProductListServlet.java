/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;

import DAO.ProductDAO;
import entity.Category;
import entity.Product;
import java.util.List;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.stream.Collectors;

/**
 *
 * @author tphon
 */
@WebServlet(name = "ProductListServlet", urlPatterns = {"/marketing/productlist"})
public class ProductListServlet extends HttpServlet {

    private ProductDAO productDAO;
    private static final int RECORDS_PER_PAGE = 10;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

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
            out.println("<title>Servlet ProductListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductListServlet at " + request.getContextPath() + "</h1>");
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
        try {
            //Lấy thông báo xủ lý
            String alert = request.getParameter("alert");
//            System.out.println(alert);
            request.setAttribute("alert", alert);

            // Lấy parameters từ request
            String keyword = request.getParameter("keyword");
            String categoryId = request.getParameter("categoryId");
            String status = request.getParameter("status");
            String sortField = request.getParameter("sortField");
            String sortDir = request.getParameter("sortDir");

            // Xử lý phân trang
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            // Xây dựng câu query SQL
//            StringBuilder sql = new StringBuilder("SELECT p.*, c.name as category_name FROM products p "
//                    + "JOIN categories c ON p.category_id = c.id WHERE 1=1");
// Xây dựng câu query SQL
            StringBuilder sql = new StringBuilder("SELECT p.*, c.name as category_name FROM products p "
                    + "JOIN categories c ON p.category_id = c.id WHERE 1=1 "); // Thêm điều kiện is_combo = false

            List<Object> params = new ArrayList<>();

            // Thêm điều kiện lọc
            if (categoryId != null && !categoryId.isEmpty()) {
                CategoryDAO cateDao = new CategoryDAO();
                List<Integer> categoryIds = cateDao.getChildCategoryIds(Integer.parseInt(categoryId));

                if (!categoryIds.isEmpty()) {
                    String placeholders = categoryIds.stream()
                            .map(id -> "?")
                            .collect(Collectors.joining(", "));
                    sql.append(" AND p.category_id IN (" + placeholders + ")");
                    params.addAll(categoryIds);
                } else {
                    sql.append(" AND p.category_id = ?");
                    params.add(Integer.parseInt(categoryId));
                }
            }
            
            if (status != null && !status.isEmpty() && !status.equals("all")) {
                sql.append(" AND p.status = ?");
                params.add(status);
            }

            // Thêm điều kiện tìm kiếm
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql.append(" AND (p.title LIKE ?)");
                params.add("%" + keyword + "%");
            }
            int totalRecords = productDAO.getTotalFilteredRecords(sql.toString(), params);

            // Thêm sắp xếp
            if (sortField != null && !sortField.isEmpty()) {
                sql.append(" ORDER BY p.").append(sortField);
                if ("desc".equals(sortDir)) {
                    sql.append(" DESC");
                } else {
                    sql.append(" ASC");
                }
            } else {
                sql.append(" ORDER BY p.id DESC");
            }

            int totalPages = (int) Math.ceil(totalRecords * 1.0 / RECORDS_PER_PAGE);

            // Thêm phân trang
            int offset = (page - 1) * RECORDS_PER_PAGE;
            sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            params.add(offset);
            params.add(RECORDS_PER_PAGE);

            // Thực hiện truy vấn
            List<Product> products = productDAO.getProductsByFilter(sql.toString(), params);

//            // Lấy thông tin về combo products - phần này sẽ dùng khi in ra sản phẩm combo liền nhau
//            if ((sortField == null || sortField.isEmpty())
//                    && (keyword == null || keyword.trim().isEmpty())
//                    && (categoryId == null || categoryId.isEmpty())) {
//                for (Product tempProduct : products) {
//                    if (tempProduct.getComboGroupId() > 0) { // Chỉ lấy combo cho sản phẩm có combo_group_id
//                        List<Product> comboProducts = productDAO.getComboProduct(tempProduct.getComboGroupId());
//                        if (!comboProducts.isEmpty()) {
//                            tempProduct.setComboProducts(comboProducts);
//                        }
//                    }
//                }
//            }
//            //________________________________________________________________________________
            //Lấy listcategory
            CategoryDAO cateDao = new CategoryDAO();
            List<Category> listCate = cateDao.getAll();
            request.setAttribute("categories", listCate);

            // Set attributes cho JSP
            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("keyword", keyword);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("status", status);
            request.setAttribute("sortField", sortField);
            request.setAttribute("sortDir", sortDir);
            request.setAttribute("totalItems", totalRecords);

            // Forward đến trang JSP
            request.getRequestDispatcher("/marketing/product/listProducts.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
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
//        processRequest(request, response);
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
