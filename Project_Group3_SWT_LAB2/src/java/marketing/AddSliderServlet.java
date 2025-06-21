package marketing;

import DAO.SliderDAO;
import entity.Slider;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

@WebServlet(name = "AddSliderServlet", urlPatterns = {"/marketing/addSlider"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class AddSliderServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the slider form page
        request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            // Get parameters from the form
            String title = request.getParameter("title");
            String link = request.getParameter("link");
            String status = request.getParameter("status");
            String notes = request.getParameter("notes");
            int display_order = 0;
            try {
                display_order = Integer.parseInt(request.getParameter("display_order"));
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Thứ tự hiển thị không hợp lệ!");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }
            
            SliderDAO sliderDAO = new SliderDAO();
            if (sliderDAO.isDisplayOrderExists(display_order, -1)) { // Pass -1 as id since this is a new slider
                request.setAttribute("error", "Thứ tự hiển thị đã tồn tại. Vui lòng chọn một thứ tự khác.");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            // Handle image upload
            String image_url = "";
            try {
                Part filePart = request.getPart("image_url");
                if (filePart != null && filePart.getSize() > 0) {
                    String uploadPath = request.getServletContext().getRealPath("") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    
                    String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                    String filePath = uploadPath + File.separator + fileName;
                    
                    filePart.write(filePath);
                    image_url = "uploads/" + fileName;
                } else {
                    request.setAttribute("error", "Vui lòng chọn hình ảnh cho slider!");
                    request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi upload ảnh: " + e.getMessage());
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            // Create and save slider
            Slider slider = new Slider();
            slider.setTitle(title);
            slider.setImage_url(image_url);
            slider.setLink(link);
            slider.setDisplay_order(display_order);
            slider.setStatus(status);
            slider.setNotes(notes);

            
            boolean isAdded = sliderDAO.addSlider(slider);

            if (isAdded) {
                response.sendRedirect("sliderList");
            } else {
                request.setAttribute("error", "Thêm slider thất bại!");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle adding new sliders";
    }
}