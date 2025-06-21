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
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "DetailPostServlet", urlPatterns = {"/marketing/detailPost"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15,   // 15 MB
    location = ""
)
public class PostDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostServlet at " + request.getContextPath() + "</h1>");
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
        String pId = request.getParameter("id");
        int postId;
        try {
            postId = Integer.parseInt(pId);
            PostDAO postDAO = new PostDAO();
            Post p = postDAO.getPostById(postId);


            request.setAttribute("post", p);
            request.getRequestDispatcher("/marketing/post/postdetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String oldThumbnail = request.getParameter("old_thumbnail");
        String summary = request.getParameter("summary");
        String content = request.getParameter("content");
        String status = request.getParameter("status");
        Date updatedAt = new Date(System.currentTimeMillis());
        
        Part thumbnailPart = request.getPart("thumbnail");
        String thumbnail = oldThumbnail; // Giữ ảnh cũ mặc định
        boolean isFeatured = request.getParameter("isFeatured") != null;
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
        }

        Post post = new Post(id, title, thumbnail, summary, content, status, updatedAt);
        post.setIsFeatured(isFeatured);
        PostDAO postDAO = new PostDAO();
        boolean isUpdated = postDAO.updatePost(post);

        Post p = postDAO.getPostById(id);


        if (isUpdated) {
            response.sendRedirect("postList");
        } else {

            request.setAttribute("post", p);
            request.setAttribute("error", "Cập nhật bài viết thất bại.");
            request.getRequestDispatcher("/marketing/post/postdetail.jsp").forward(request, response);
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
