/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DAO.CategoryDAO;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author thanh
 */
@WebServlet(name = "CategoryAddServlet", urlPatterns = {"/admin/categoryadd"})
public class CategoryAddServlet extends HttpServlet {

    private CategoryDAO categoryDAO = new CategoryDAO();

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
            out.println("<title>Servlet CategoryAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryAddServlet at " + request.getContextPath() + "</h1>");
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
            // Lấy danh sách các danh mục có thể chọn làm cha (level 1 và 2)
            List<Category> potentialParents = categoryDAO.getPotentialParents();
            request.setAttribute("potentialParents", potentialParents);
            request.getRequestDispatcher("addcategory.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error in CategoryAddServlet.doGet: " + e.getMessage());
            response.sendRedirect("error.jsp");
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
        try {
            request.setCharacterEncoding("UTF-8");

            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String parentIdStr = request.getParameter("parentId");
            String status = request.getParameter("status");

            // Validate name
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập tên danh mục");
                request.getRequestDispatcher("addcategory.jsp").forward(request, response);
                return;
            }

            // Xử lý parent_id và level
            Integer parentId = null;
            int level = 1;

            if (parentIdStr != null && !parentIdStr.trim().isEmpty()) {
                try {
                    parentId = Integer.parseInt(parentIdStr);
                    // Lấy thông tin category cha
                    Category parentCategory = categoryDAO.getCategoryById(parentId);
                    if (parentCategory != null) {
                        if (parentCategory.getLevel() >= 3) {
                            request.setAttribute("error", "Không thể thêm danh mục con vào cấp 3");
                            request.getRequestDispatcher("addcategory.jsp").forward(request, response);
                            return;
                        }
                        level = parentCategory.getLevel() + 1;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Danh mục cha không hợp lệ");
                    request.getRequestDispatcher("addcategory.jsp").forward(request, response);
                    return;
                }
            }

            // Tạo category mới
            Category newCategory = new Category();
            newCategory.setName(name);
            newCategory.setDescription(description);
            newCategory.setParentId(parentId);
            newCategory.setLevel(level);
            newCategory.setStatus(status != null ? status : "active");

            // Thêm vào database
            boolean success = categoryDAO.addCategory(newCategory);

            if (success) {
                response.sendRedirect("categorylists");
            } else {
                request.setAttribute("error", "Không thể thêm danh mục");
                request.getRequestDispatcher("addcategory.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error in CategoryAddServlet.doPost: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("addcategory.jsp").forward(request, response);
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
