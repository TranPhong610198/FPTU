/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.PostDAO;
import entity.Post;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AddPostServlet", urlPatterns = {"/marketing/addPost"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class AddPostServlet extends HttpServlet {

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
            out.println("<title>Servlet AddPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPostServlet at " + request.getContextPath() + "</h1>");
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
        PostDAO postDAO = new PostDAO();
    List<User> users = postDAO.getAuthorsByRole(); // Lấy danh sách admin & marketing
    request.setAttribute("users", users);

    request.getRequestDispatcher("/marketing/post/postform.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
    try {
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String content = request.getParameter("content");
        String status = request.getParameter("status");
        Date createdAt = new Date(System.currentTimeMillis());
        boolean isFeatured = request.getParameter("isFeatured") != null;
        
        
        // Xử lý file ảnh
        String thumbnail = "";
        try {
            Part filePart = request.getPart("thumbnail");
            if (filePart != null && filePart.getSize() > 0) {
                String uploadPath = request.getServletContext().getRealPath("") + "uploads/post/";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                String filePath = uploadPath + File.separator + fileName;
                
                filePart.write(filePath);
                thumbnail = "uploads/post/" + fileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi upload ảnh: " + e.getMessage());
            request.getRequestDispatcher("/marketing/post/postform.jsp").forward(request, response);
            return;
        }

        // Kiểm tra session user
        HttpSession session = request.getSession();
        User existingUser = (User) session.getAttribute("acc");
        if (existingUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Tạo và lưu post
        Post post = new Post();
        post.setTitle(title);
        post.setThumbnail(thumbnail);
        post.setSummary(summary);
        post.setContent(content);
        post.setStatus(status);
        post.setCreatedAt(createdAt);
        post.setUser(existingUser);
        post.setIsFeatured(isFeatured); 

        PostDAO postDAO = new PostDAO();
        boolean isAdded = postDAO.addPost(post);

        if (isAdded) {
            response.sendRedirect("postList");
        } else {
            request.setAttribute("error", "Thêm bài viết thất bại!");
            request.getRequestDispatcher("/marketing/post/postform.jsp").forward(request, response);
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("error", "Lỗi: " + e.getMessage());
        request.getRequestDispatcher("/marketing/post/postform.jsp").forward(request, response);
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
