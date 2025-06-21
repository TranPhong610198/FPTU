/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author tphon
 */
@WebServlet(urlPatterns = {"/listproduct"})
public class ListProductServlet extends HttpServlet {

    private static final int RECORDS_PER_PAGE = 12;
    private ProductDAO productDAO = new ProductDAO();

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
            out.println("<title>Servlet ListProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductServlet at " + request.getContextPath() + "</h1>");
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
            CategoryDAO categoryDAO = new CategoryDAO();

            // Get filter parameters
            String keyword = request.getParameter("keyword");
            String categoryId = request.getParameter("category");
            String minPrice = request.getParameter("minPrice");
            String maxPrice = request.getParameter("maxPrice");
            String sortBy = request.getParameter("sortBy");
//            String status = request.getParameter("status");

            // Handle pagination
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page").trim());
            }

            // Build base query
            StringBuilder sql = new StringBuilder("SELECT p.*, c.name as category_name FROM products p "
                    + "JOIN categories c ON p.category_id = c.id WHERE p.status = 'active' AND 1=1");
            List<Object> params = new ArrayList<>();

            // Add category filter with subcategories support
            if (categoryId != null && !categoryId.trim().isEmpty()) {
                List<Integer> categoryIds = categoryDAO.getChildCategoryIds(Integer.parseInt(categoryId.trim()));
                if (!categoryIds.isEmpty()) {
                    String placeholders = categoryIds.stream()
                            .map(id -> "?")
                            .collect(Collectors.joining(", "));
                    sql.append(" AND p.category_id IN (" + placeholders + ")");
                    params.addAll(categoryIds);
                } else {
                    sql.append(" AND p.category_id = ?");
                    params.add(Integer.parseInt(categoryId.trim()));
                }
            }

            // Add keyword search
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql.append(" AND (p.title LIKE ? OR p.description LIKE ?)");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
            }

            // Add price range filter
            if (minPrice != null && !minPrice.isEmpty()) {
                sql.append(" AND p.sale_price >= ?");
                params.add(new BigDecimal(minPrice));
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                sql.append(" AND p.sale_price <= ?");
                params.add(new BigDecimal(maxPrice));
            }

            // Get total records for pagination
            int totalRecords = productDAO.getTotalFilteredRecords(sql.toString(), params);
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / RECORDS_PER_PAGE);
//            System.out.println(totalRecords + ";" + totalPages + "Dòng 133");
//            System.out.println(page);

            // Add sorting
            if (sortBy != null) {
                switch (sortBy) {
                    case "price_asc":
                        sql.append(" ORDER BY p.sale_price ASC");
                        break;
                    case "price_desc":
                        sql.append(" ORDER BY p.sale_price DESC");
                        break;
                    case "newest":
                        sql.append(" ORDER BY p.created_at DESC");
                        break;
                    default:
                        sql.append(" ORDER BY p.id DESC");
                }
            } else {
                sql.append(" ORDER BY p.id DESC");
            }

            // Add pagination
            int offset = (page - 1) * RECORDS_PER_PAGE;
            sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            params.add(offset);
            params.add(RECORDS_PER_PAGE);

            // Execute query
            List<Product> products = productDAO.getProductsByFilter(sql.toString(), params);

            // Lấy thông tin về combo products - phần này sẽ dùng khi in ra sản phẩm combo liền nhau
            if ((sortBy == null || sortBy.isEmpty())
                    && (keyword == null || keyword.trim().isEmpty())
                    && (categoryId == null || categoryId.isEmpty())) {
                for (Product tempProduct : products) {
                    if (tempProduct.getComboGroupId() > 0) { // Chỉ lấy combo cho sản phẩm có combo_group_id
                        List<Product> comboProducts = productDAO.getComboProduct(tempProduct.getComboGroupId());
                        if (!comboProducts.isEmpty()) {
                            tempProduct.setComboProducts(comboProducts);
                        }
                    }
//                    System.out.println("Dòng 169 test combo: "+tempProduct.getComboProducts().toString());
                }
            }
            
            //________________________________________________________________________________
            // Get category name if category filter is applied
            String categoryName = null;
            if (categoryId != null && !categoryId.trim().isEmpty()) {
                Category category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));
                if (category != null) {
                    categoryName = category.getName();
                }
            }

            // Get all categories for filter
            List<Category> categories = categoryDAO.getAll();

            // Set attributes for JSP
            request.setAttribute("products", products);
            request.setAttribute("categories", categories);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("keyword", keyword);
            request.setAttribute("selectedCategory", categoryId);
            request.setAttribute("minPrice", minPrice);
            request.setAttribute("maxPrice", maxPrice);
            request.setAttribute("sortBy", sortBy);
//            request.setAttribute("status", status);
            request.setAttribute("totalItems", totalRecords);

            // Forward to JSP
            request.getRequestDispatcher("productList.jsp").forward(request, response);

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
