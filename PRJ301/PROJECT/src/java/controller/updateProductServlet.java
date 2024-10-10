/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
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
import java.math.BigDecimal;
import java.util.UUID;
import model.Product;

/**
 *
 * @author tphon
 */
@WebServlet(name = "updateProductServlet", urlPatterns = {"/updateProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class updateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet updateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProductServlet at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        try {
            int id = Integer.parseInt(id_raw);
            ProductDAO pd = new ProductDAO();
            Product temp = pd.getProductByID(id);
            request.setAttribute("oldProduct", temp);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF8");

//        String imageUrl = "";
        String oldImageUrl = request.getParameter("oldImageUrl");
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String descrip = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String stock_raw = request.getParameter("stock");
        String brand = request.getParameter("brand");
        String categoryId_raw = request.getParameter("categoryId");

//        // Nhận file ảnh từ form
//        Part filePart = request.getPart("image");
//        String fileName = extractFileName(filePart);
        try {

//------------------------------------------------------------------------------------------------------------------------
//            // Đường dẫn lưu file ảnh (lưu vào thư mục 'images' trong server)
//            String savePath = "D:/CODING/FPTU/PRJ301/PROJECT/web/imagesDB" + File.separator + fileName;
//            File fileSaveDir = new File(savePath);
//            if (fileName != null && !fileName.isEmpty()) {
//                filePart.write(savePath); // Lưu ảnh vào thư mục
//            }
//            // Tạo URL của ảnh (ví dụ URL sẽ là "/images/filename.jpg")
//            String newImageUrl = "imagesDB/" + fileName;
//            if(!newImageUrl.equals(oldImageUrl) && !newImageUrl.equals("imagesDB/")){
//                imageUrl = newImageUrl;
//            }else{
//                imageUrl = oldImageUrl;
//            }
//            System.out.println(imageUrl);
//-------------------------------------------------------------------------------------------------------------------------
            int id = Integer.parseInt(id_raw);
            BigDecimal price = new BigDecimal(price_raw);
            int stock = Integer.parseInt(stock_raw);
            int categoryId = Integer.parseInt(categoryId_raw);

            // Lấy thông tin sản phẩm cũ từ DB (bao gồm URL ảnh cũ)
            ProductDAO pd = new ProductDAO();
//            Product oldProduct = pd.getProductByID(id);
//            String oldImageUrl = oldProduct.getImageUrl(); // URL ảnh cũ
//            System.out.println(oldImageUrl);
            
            // Kiểm tra xem có file ảnh được tải lên hay không
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();

            String imageUrl;
            if (fileName != null && !fileName.isEmpty()) {
                // Nếu có ảnh mới, xóa ảnh cũ và lưu ảnh mới
                String uploadPath = "D:/CODING/FPTU/PRJ301/PROJECT/web/";

                // Xóa ảnh cũ
                File oldImageFile = new File(uploadPath + File.separator + oldImageUrl);
                if (oldImageFile.exists()) {
                    oldImageFile.delete();
                }

                // Tạo tên mới cho ảnh
                String newFileName = UUID.randomUUID().toString();
                imageUrl = "imagesDB/" + newFileName; // URL của ảnh mới

                // Lưu ảnh mới vào thư mục
                filePart.write(uploadPath + File.separator + imageUrl);
            } else {
                // Nếu không có ảnh mới, giữ lại URL ảnh cũ
                imageUrl = oldImageUrl;
            }
//-------------------------------------------------------------------------------------------------------------------------------
            Product temp = new Product(id, name, descrip, price, stock, brand, categoryId, imageUrl);
            pd.updateProduct(temp);
            response.sendRedirect("listProduct");
        } catch (IOException | NumberFormatException e) {
            System.out.println(e);
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
