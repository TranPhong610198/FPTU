package admin;

import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

@WebServlet(name = "FooterSettingNewServlet", urlPatterns = {"/admin/footer-settings/new"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class FooterSettingNewServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/footersettingnew.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from the form
            String fieldName = request.getParameter("fieldName");
            String value = request.getParameter("value");
            String type = request.getParameter("type");
            String status = request.getParameter("status");
            
            // Xử lý ảnh
            String image = null;
            Part imagePart = request.getPart("image");
            
            // Kiểm tra xem người dùng có tải ảnh lên không
            if (imagePart != null && imagePart.getSize() > 0) {
                // Kiểm tra định dạng ảnh
                if (!isValidImage(imagePart)) {
                    request.setAttribute("error", "File ảnh không hợp lệ. Chỉ chấp nhận JPG, PNG, GIF, WEBP.");
                    request.getRequestDispatcher("/admin/footersettingnew.jsp").forward(request, response);
                    return;
                }
                
                // Lưu ảnh và lấy đường dẫn
                image = saveImage(imagePart, request);
            }

            // Create new Footer object
            Footer footer = new Footer();
            footer.setFieldName(fieldName);
            footer.setValue(value);
            footer.setType(type);
            footer.setStatus(status);
            footer.setImage(image);

            // Save to database
            FooterDAO dao = new FooterDAO();
            dao.insertFooter(footer);

            // Redirect back to footer settings list with success message
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings?message=success");
            
        } catch (Exception e) {
            e.printStackTrace();
            // If error occurs, go back to the form with error message
            request.setAttribute("error", "Có lỗi xảy ra khi thêm cài đặt mới.");
            request.getRequestDispatcher("/admin/footersettingnew.jsp").forward(request, response);
        }
    }
    
    // Hàm lưu ảnh vào thư mục uploads/footerImages
    private String saveImage(Part part, HttpServletRequest request) {
        try {
            String oldFName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String fileExtension = oldFName.substring(oldFName.lastIndexOf("."));
            String fileName = "footer_" + System.currentTimeMillis() + fileExtension; // Tạo tên file mới
            String uploadDir = request.getServletContext().getRealPath("/uploads/footerImages"); // Đường dẫn thư mục

            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs(); // Tạo thư mục nếu chưa tồn tại
            }

            String filePath = uploadDir + File.separator + fileName;
            part.write(filePath); // Lưu ảnh vào thư mục trên server
            return "uploads/footerImages/" + fileName; // Trả về đường dẫn ảnh
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Hàm kiểm tra đuôi file
    private boolean isValidImage(Part part) {
        String contentType = part.getContentType();
        return contentType.equals("image/jpeg")
                || contentType.equals("image/png")
                || contentType.equals("image/gif")
                || contentType.equals("image/webp");
    }
}