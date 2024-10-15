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
import jakarta.servlet.http.Part;
import java.io.File;
import java.math.BigDecimal;
import model.Product;
import jakarta.servlet.annotation.MultipartConfig;
import java.util.UUID;
/**
 *
 * @author tphon
 */
@WebServlet(name = "addProductSevlet", urlPatterns = {"/addProduct"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)

public class addProductSevlet extends HttpServlet {

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
            out.println("<title>Servlet addProductSevlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addProductSevlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF8");
//        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String descrip = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String stock_raw = request.getParameter("stock");
        String brand = request.getParameter("brand").toUpperCase();
        String categoryId_raw = request.getParameter("categoryId");

        // Nhận file ảnh từ form
        Part filePart = request.getPart("image");
        String fileName = extractFileName(filePart);
        String newFileName = UUID.randomUUID().toString()+fileName;
        
        // Đường dẫn lưu file ảnh (lưu vào thư mục 'images' trong server)
        String savePath = "D:/CODING/FPTU/PRJ301/PROJECT/web/imagesDB" + File.separator + newFileName;
        File fileSaveDir = new File(savePath);
        filePart.write(savePath); // Lưu ảnh vào thư mục

        // Tạo URL của ảnh (ví dụ URL sẽ là "/images/filename.jpg")
        String imageUrl = "imagesDB/" + newFileName;

        try {
//            int id = Integer.parseInt(id_raw);
            BigDecimal price = new BigDecimal(price_raw);
            int stock = Integer.parseInt(stock_raw);
            int categoryId = Integer.parseInt(categoryId_raw);
            Product temp = new Product(name, descrip, price, stock, brand, categoryId, imageUrl);
            ProductDAO pd = new ProductDAO();
            pd.addProduct(temp);

            response.sendRedirect("listProduct");
        } catch (NumberFormatException e) {
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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