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
@WebServlet(name="CategoryDetailServlet", urlPatterns={"/admin/categorydetail"})
public class CategoryDetailServlet extends HttpServlet {
   private CategoryDAO categoryDAO = new CategoryDAO();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CategoryDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.trim().isEmpty()) {
                response.sendRedirect("categorylists?error=ID danh mục không hợp lệ");
                return;
            }

            int id = Integer.parseInt(idStr);
            Category category = categoryDAO.getCategoryById(id);
            
            if (category == null) {
                response.sendRedirect("categorylists?error=Không tìm thấy danh mục");
                return;
            }

            // Lấy danh sách các danh mục con (nếu có)
            List<Category> childCategories = categoryDAO.getChildCategories(id);
            
            // Lấy thông tin danh mục cha (nếu có)
            if (category.getParentId() != null) {
                Category parentCategory = categoryDAO.getCategoryById(category.getParentId());
                request.setAttribute("parentCategory", parentCategory);
            }

            // Lấy danh sách các danh mục có thể chọn làm cha
            List<Category> potentialParents = categoryDAO.getPotentialParents();
            
            // Set attributes
            request.setAttribute("category", category);
            request.setAttribute("childCategories", childCategories);
            request.setAttribute("potentialParents", potentialParents);

            // Forward to JSP
            request.getRequestDispatcher("categorydetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("categorylists?error=ID danh mục không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
     

    /** 
     * Handles the HTTP <code>POST</code> method.
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
            
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String parentIdStr = request.getParameter("parentId");
            String status = request.getParameter("status");

            // Validate name
            if (name == null || name.trim().isEmpty()) {
                String errorMsg = java.net.URLEncoder.encode("Vui lòng nhập tên danh mục", "UTF-8");
                response.sendRedirect("categorydetail?id=" + id + "&error=" + errorMsg);
                return;
            }

            // Xử lý parent_id và level
            Integer parentId = null;
            int level = 1;
            
            if (parentIdStr != null && !parentIdStr.trim().isEmpty()) {
                try {
                    parentId = Integer.parseInt(parentIdStr);
                    Category parentCategory = categoryDAO.getCategoryById(parentId);
                    if (parentCategory != null) {
                        if (parentCategory.getLevel() >= 3) {
                            String errorMsg = java.net.URLEncoder.encode("Không thể chọn danh mục cấp 3 làm cha", "UTF-8");
                            response.sendRedirect("categorydetail?id=" + id + "&error=" + errorMsg);
                            return;
                        }
                        level = parentCategory.getLevel() + 1;
                    }
                } catch (NumberFormatException e) {
                    String errorMsg = java.net.URLEncoder.encode("Danh mục cha không hợp lệ", "UTF-8");
                    response.sendRedirect("categorydetail?id=" + id + "&error=" + errorMsg);
                    return;
                }
            }

            // Cập nhật category
            Category category = new Category();
            category.setId(id);
            category.setName(name);
            category.setDescription(description);
            category.setParentId(parentId);
            category.setLevel(level);
            category.setStatus(status);

            boolean success = categoryDAO.updateCategory(category);

            if (success) {
                String msg = java.net.URLEncoder.encode("Cập nhật thành công", "UTF-8");
                response.sendRedirect("categorydetail?id=" + id + "&message=" + msg);
            } else {
                String errorMsg = java.net.URLEncoder.encode("Không thể cập nhật danh mục", "UTF-8");
                response.sendRedirect("categorydetail?id=" + id + "&error=" + errorMsg);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
