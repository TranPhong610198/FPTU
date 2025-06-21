package admin;

import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import java.io.File;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "FooterDetailServlet", urlPatterns = {"/admin/footer-settings/edit"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class FooterDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            FooterDAO dao = new FooterDAO();
            Footer footer = dao.getFooterById(id);

            if (footer != null) {
                request.setAttribute("footer", footer);
                request.getRequestDispatcher("/admin/footerdetail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters
            int id = Integer.parseInt(request.getParameter("id"));
            String fieldName = request.getParameter("fieldName");
            String value = request.getParameter("value");
            String type = request.getParameter("type");
            String status = request.getParameter("status");
            String currentImage = request.getParameter("currentImage");
            String image = currentImage; // Giữ nguyên ảnh cũ nếu không có ảnh mới

            // Xử lý ảnh mới nếu có
            Part imagePart = request.getPart("image");
            if (imagePart != null && imagePart.getSize() > 0) {
                // Kiểm tra định dạng file
                if (!isValidImage(imagePart)) {
                    request.setAttribute("error", "Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP)");
                    request.setAttribute("footer", new Footer(id, type, fieldName, value, status, currentImage));
                    request.getRequestDispatcher("/admin/footerdetail.jsp").forward(request, response);
                    return;
                }

                // Lưu ảnh mới
                image = saveImage(imagePart, request);
            }

            // Validate required fields
            if (fieldName == null || fieldName.trim().isEmpty()
                    || value == null || value.trim().isEmpty()
                    || type == null || type.trim().isEmpty()) {

                request.setAttribute("error", "All required fields must be filled out");
                doGet(request, response);
                return;
            }

            // Create Footer object and update
            Footer footer = new Footer(id, type, fieldName, value, status, image);
            FooterDAO dao = new FooterDAO();
            dao.updateFooter(footer);

            // Redirect with success message
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
        }
    }

    // Hàm lưu ảnh vào thư mục uploads/footerImages
    private String saveImage(Part part, HttpServletRequest request) {
        try {
            String oldFName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String fileExtension = oldFName.substring(oldFName.lastIndexOf("."));
            String fileName = "icon_" + System.currentTimeMillis() + fileExtension; // Tạo tên file mới
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
