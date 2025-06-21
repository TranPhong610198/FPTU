/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import DAO.ProductDAO;
import entity.Color;
import entity.Size;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddModelServlet", urlPatterns = {"/marketing/addModel"})
public class AddModelServlet extends HttpServlet {

    private static final Pattern COLOR_PATTERN = Pattern.compile("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$");
    private static final int MAX_QUANTITY = 500000;

    public static String generateSKU(String productName, int productId, String colorName, String sizeName) {
        // chuẩn hóa 
        String normalizedProduct = Normalizer.normalize(productName, Normalizer.Form.NFD).replaceAll("\\p{M}", "").replace("Đ", "D").replace("đ", "d");

        String[] productWords = normalizedProduct.trim().split("\\s+");
        StringBuilder productSKU = new StringBuilder();
        for (String word : productWords) {
            if (!word.isEmpty()) {
                productSKU.append(word.charAt(0));
            }
        }

        String normalizedColor = Normalizer.normalize(colorName, Normalizer.Form.NFD).replaceAll("\\p{M}", "").replace("Đ", "D").replace("đ", "d").trim();
        String colorPart;
        String[] colorWords = normalizedColor.split("\\s+");
        
        if (normalizedColor.length() <= 5) {
            colorPart = normalizedColor.replaceAll("\\s+", ""); // Giữ nguyên nếu ≤ 5 ký tự
        } else {
            StringBuilder colorStr = new StringBuilder();
            colorStr.append(colorWords[0]); // Giữ nguyên từ đầu tiên
            for (int i = 1; i < colorWords.length; i++) {
                if (!colorWords[i].isEmpty()) {
                    colorStr.append(colorWords[i].charAt(0)); // Lấy chữ cái đầu của từ còn lại
                }
            }
            colorPart = colorStr.toString();
        }

        String sizePart = sizeName.trim();

        return (productSKU.toString() + productId + "-" + colorPart + "-" + sizePart).toUpperCase();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String source = request.getParameter("source");
        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("inventorylist");
            return;
        }
        request.setAttribute("productId", productId);
        request.setAttribute("source", source);
        request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        InventoryDAO inventoryDao = new InventoryDAO();
        ProductDAO productDao = new ProductDAO();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String source = request.getParameter("source");
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            String quantityStr = request.getParameter("quantity");

            // Validation
            if (!COLOR_PATTERN.matcher(colorName).matches()) {
                request.setAttribute("errorMessage", "Màu sắc chỉ được phép chứa chữ cái và khoảng trắng");
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            int quantity;
            try {
                if (quantityStr.length() > 9) {
                    request.setAttribute("errorMessage", "Số lượng phải từ 0 đến 1,000,000");
                    request.setAttribute("productId", productId);
                    request.setAttribute("source", source);
                    request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                    return;
                }

                quantity = Integer.parseInt(quantityStr);
                if (quantity < 0 || quantity > MAX_QUANTITY) {
                    request.setAttribute("errorMessage", "Số lượng phải từ 0 đến 1,000,000");
                    request.setAttribute("productId", productId);
                    request.setAttribute("source", source);
                    request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Số lượng không hợp lệ");
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            // Lấy thông tin sản phẩm để tạo SKU
            String productName = productDao.getProductNameById(productId); 
            if (productName == null) {
                throw new SQLException("Không tìm thấy sản phẩm với ID: " + productId);
            }

            // Tạo SKU
            String sku = generateSKU(productName, productId, colorName, sizeName);

            Color color = inventoryDao.getColorByName(productId, colorName);
            Size size = inventoryDao.getSizeByName(productId, sizeName);

            int colorId;
            if (color != null) {
                colorId = color.getId();
            } else {
                colorId = inventoryDao.addColor(productId, colorName);
                if (colorId == -1) {
                    throw new SQLException("Không thể tạo màu mới");
                }
            }

            int sizeId;
            if (size != null) {
                sizeId = size.getId();
            } else {
                sizeId = inventoryDao.addSize(productId, sizeName);
                if (sizeId == -1) {
                    throw new SQLException("Không thể tạo kích thước mới");
                }
            }

            if (inventoryDao.isVariantExists(productId, colorId, sizeId)) {
                request.setAttribute("errorMessage", "Mẫu này đã tồn tại");
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            // Thêm variant mới với SKU
            inventoryDao.addNewVariant(productId, colorId, sizeId, quantity, sku);

            // Cập nhật trạng thái sản phẩm nếu cần
            productDao.updateProductStatusIfNeeded(productId);

            // Tạo URL chuyển hướng với source
            String redirectUrl = "inventoryDetail?id=" + productId + "&success=add";
            if (source != null && !source.trim().isEmpty()) {
                redirectUrl += "&source=" + source;
            }
            response.sendRedirect(redirectUrl);

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("productId", request.getParameter("productId"));
            request.setAttribute("source", request.getParameter("source"));
            request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
        }
    }
}