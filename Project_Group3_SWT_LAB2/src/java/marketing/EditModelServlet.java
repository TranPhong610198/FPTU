/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import DAO.ProductDAO;
import entity.Color;
import entity.Size;
import entity.Variant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.Normalizer;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditModelServlet", urlPatterns = {"/marketing/editModel"})
public class EditModelServlet extends HttpServlet {

    private static final Pattern COLOR_PATTERN = Pattern.compile("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$");
    private static final int MAX_QUANTITY = 500000;

//    private String generateSKU(String productName, String colorName, String sizeName) {
//        String[] productWords = productName.trim().split("\\s+");
//        StringBuilder product_sku = new StringBuilder();
//        for (String word : productWords) {
//            if (!word.isEmpty()) {
//                product_sku.append(word.charAt(0));
//            }
//        }
//
//        String[] colorWords = colorName.trim().split("\\s+");
//        StringBuilder colorPart = new StringBuilder();
//        for (String word : colorWords) {
//            if (!word.isEmpty()) {
//                colorPart.append(word.charAt(0));
//            }
//        }
//
//        String sizePart = sizeName.trim();
//        return (product_sku + "-" + colorPart + "-" + sizePart).toUpperCase();
//    }
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
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            String source = request.getParameter("source");
            InventoryDAO dao = new InventoryDAO();
            Variant variant = dao.getVariant(variantId);

            if (variant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            request.setAttribute("variant", variant);
            request.setAttribute("source", source);
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        InventoryDAO inventoryDao = new InventoryDAO();
        ProductDAO productDao = new ProductDAO();

        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            String source = request.getParameter("source");
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            String quantityStr = request.getParameter("quantity");

            // Validation cho màu sắc
            if (!COLOR_PATTERN.matcher(colorName).matches()) {
                request.setAttribute("errorMessage", "Màu sắc chỉ được phép chứa chữ cái và khoảng trắng");
                Variant variant = inventoryDao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Validation cho số lượng
            int quantity;
            try {
                if (quantityStr.length() > 9) {
                    request.setAttribute("errorMessage", "Số lượng phải từ 0 đến 1,000,000");
                    Variant variant = inventoryDao.getVariant(variantId);
                    request.setAttribute("variant", variant);
                    request.setAttribute("source", source);
                    request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                    return;
                }

                quantity = Integer.parseInt(quantityStr);
                if (quantity < 0 || quantity > MAX_QUANTITY) {
                    request.setAttribute("errorMessage", "Số lượng phải từ 0 đến 1,000,000");
                    Variant variant = inventoryDao.getVariant(variantId);
                    request.setAttribute("variant", variant);
                    request.setAttribute("source", source);
                    request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Số lượng không hợp lệ");
                Variant variant = inventoryDao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            Variant currentVariant = inventoryDao.getVariant(variantId);
            if (currentVariant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            // Lấy tên sản phẩm để tạo SKU
            String productName = productDao.getProductNameById(productId);

            // Tạo SKU mới dựa trên thông tin cập nhật
            String newSku = generateSKU(productName, productId, colorName, sizeName);

            int oldColorId = currentVariant.getColor().getId();
            int oldSizeId = currentVariant.getSize().getId();

            Color newColor;
            if (currentVariant.getColor().getName().equalsIgnoreCase(colorName)) {
                newColor = currentVariant.getColor();
            } else {
                newColor = inventoryDao.getColorByName(productId, colorName);
                if (newColor == null) {
                    int usageCount = inventoryDao.countVariantsUsingColor(oldColorId);
                    if (usageCount == 1) {
                        inventoryDao.updateColor(oldColorId, colorName);
                        newColor = new Color(oldColorId, colorName);
                    } else {
                        int newColorId = inventoryDao.addColor(productId, colorName);
                        newColor = new Color(newColorId, colorName);
                    }
                }
            }

            Size newSize;
            if (currentVariant.getSize().getName().equalsIgnoreCase(sizeName)) {
                newSize = currentVariant.getSize();
            } else {
                newSize = inventoryDao.getSizeByName(productId, sizeName);
                if (newSize == null) {
                    int usageCount = inventoryDao.countVariantsUsingSize(oldSizeId);
                    if (usageCount == 1) {
                        inventoryDao.updateSize(oldSizeId, sizeName);
                        newSize = new Size(oldSizeId, sizeName);
                    } else {
                        int newSizeId = inventoryDao.addSize(productId, sizeName);
                        newSize = new Size(newSizeId, sizeName);
                    }
                }
            }

            if (inventoryDao.isVariantExists(productId, newColor.getId(), newSize.getId(), variantId)) {
                request.setAttribute("errorMessage", "Mẫu với màu sắc và kích thước này đã tồn tại");
                request.setAttribute("variant", currentVariant);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Cập nhật variant với SKU mới
            inventoryDao.updateVariant(variantId, newColor.getId(), newSize.getId(), quantity, newSku);

            // Cập nhật trạng thái sản phẩm nếu cần
            productDao.updateProductStatusIfNeeded(productId);

            // Cleanup các màu sắc và kích thước không còn sử dụng
            if (oldColorId != newColor.getId()) {
                inventoryDao.cleanupOrphanColor(oldColorId);
            }
            if (oldSizeId != newSize.getId()) {
                inventoryDao.cleanupOrphanSize(oldSizeId);
            }

            // Tạo URL chuyển hướng với source
            String redirectUrl = "inventoryDetail?id=" + productId + "&success=edit";
            if (source != null && !source.trim().isEmpty()) {
                redirectUrl += "&source=" + source;
            }
            response.sendRedirect(redirectUrl);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.setAttribute("variant", inventoryDao.getVariant(Integer.parseInt(request.getParameter("variantId"))));
            request.setAttribute("source", request.getParameter("source"));
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
        } 
    }
}