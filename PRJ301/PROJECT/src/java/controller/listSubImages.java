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
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import model.Product;
import model.SubImage;

/**
 *
 * @author tphon
 */
@WebServlet(name = "listSubImages", urlPatterns = {"/listSubImages"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class listSubImages extends HttpServlet {

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
            out.println("<title>Servlet listSubImages</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listSubImages at " + request.getContextPath() + "</h1>");
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
        String productId_raw = request.getParameter("id");
        int productId = -1;

        try {
            productId = Integer.parseInt(productId_raw);
        } catch (Exception e) {
            System.out.println(e);
        }
        ProductDAO pd = new ProductDAO();
        Product tempP = pd.getProductByID(productId);
        List<SubImage> allSub = tempP.getListSubImages();
        String[] listSub = new String[4];
        int i=0;
        for(SubImage temp : allSub){
            if (temp.getProductId()==productId){
                listSub[i] = temp.getSubImagePath();
                i++;
            }
        }
        request.setAttribute("listSub", listSub);
        request.setAttribute("mainName", tempP.getName());
        request.setAttribute("prdId", tempP.getId());
        request.getRequestDispatcher("subImageCRUD.jsp").forward(request, response);
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
        String productId_raw = request.getParameter("pId");
        String[] oldImgUrls = request.getParameterValues("oldIMG");
        System.out.println(productId_raw);
        int productId = 0;
        try {
            productId = Integer.parseInt(productId_raw);
        } catch (Exception e) {
            System.out.println(e);
        }
        // Nhận file ảnh phụ mới từ form (nếu có)
        List<String> subImageUrls = new ArrayList<>();
        for (int i = 1; i <= 4; i++) {
            Part subImagePart = request.getPart("subImage" + i);
            if (subImagePart != null && subImagePart.getSize() > 0) {
                String subImageFileName = saveImageToServer(subImagePart);
                subImageUrls.add("imagesDB/" + subImageFileName);
                File oldImageFile = new File("D:/CODING/FPTU/PRJ301/PROJECT/web/" + File.separator + oldImgUrls[i-1]);
                if (oldImageFile.exists()) {
                    oldImageFile.delete();
                }
            }else{
                subImageUrls.add(oldImgUrls[i-1]);
            }
        }
        
//        for (String temp : subImageUrls) {
//            System.out.println(temp);
//        }

        ProductDAO pd = new ProductDAO();
        pd.updateSubImages(productId, subImageUrls);
        response.sendRedirect("listProduct");
    }
    // Phương thức để lấy tên file từ part

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

    // Phương thức để lưu file ảnh vào server và trả về tên file
    private String saveImageToServer(Part imagePart) throws IOException {
        String fileName = extractFileName(imagePart);
        String newFileName = UUID.randomUUID().toString() + "_" + fileName;
        String savePath = "D:/CODING/FPTU/PRJ301/PROJECT/web/imagesDB" + File.separator + newFileName;
        File fileSaveDir = new File(savePath);
        imagePart.write(savePath);  // Lưu ảnh vào folder server
        return newFileName;         // Trả về tên file đã lưu
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
