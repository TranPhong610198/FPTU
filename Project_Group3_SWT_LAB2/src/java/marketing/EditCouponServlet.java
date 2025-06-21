/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.CouponDAO;
import entity.Coupon;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditCouponServlet", urlPatterns = {"/marketing/editCoupon"})
public class EditCouponServlet extends HttpServlet {

    private static final BigDecimal MIN_AMOUNT = new BigDecimal("500"); // 1.000 VNĐ
    private static final BigDecimal MAX_AMOUNT = new BigDecimal("5000000"); // 10 triệu VNĐ
    private static final int MAX_USAGE_LIMIT = 1_000_000; // 1 triệu lần
    private static final BigDecimal MAX_PERCENTAGE = new BigDecimal("50"); // 50%

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CouponDAO couponDAO = new CouponDAO();
            Coupon coupon = couponDAO.getCouponById(id);

            if (coupon != null) {
                request.setAttribute("coupon", coupon);
            } else {
                request.setAttribute("message", "Không tìm thấy mã giảm giá.");
                request.setAttribute("messageType", "danger");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "ID không hợp lệ.");
            request.setAttribute("messageType", "danger");
        }
        request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CouponDAO couponDAO = new CouponDAO();
        StringBuilder errorMessages = new StringBuilder();

        // Lấy dữ liệu từ request
        String idStr = request.getParameter("id");
        String code = request.getParameter("code");
        String discountType = request.getParameter("discount_type");
        String discountValueStr = request.getParameter("discount_value");
        String minOrderAmountStr = request.getParameter("min_order_amount");
        String maxDiscountStr = request.getParameter("max_discount");
        String usageLimitStr = request.getParameter("usage_limit");
        String expiryDateStr = request.getParameter("expiry_date");
        String status = request.getParameter("status") != null ? "active" : "inactive";

        // Kiểm tra ID
        int id;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID không hợp lệ.");
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            return;
        }

        // Lấy coupon gốc
        Coupon originalCoupon = couponDAO.getCouponById(id);
        if (originalCoupon == null) {
            request.setAttribute("error", "Không tìm thấy mã giảm giá để chỉnh sửa.");
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            return;
        }

        // Kiểm tra dữ liệu đầu vào
        if (!validateCouponData(couponDAO, code, discountType, discountValueStr, minOrderAmountStr,
                maxDiscountStr, usageLimitStr, expiryDateStr, originalCoupon.getCode(), errorMessages)) {
            setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                    maxDiscountStr, usageLimitStr, expiryDateStr, status);
            request.setAttribute("error", errorMessages.toString());
            request.setAttribute("coupon", originalCoupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            return;
        }

        try {
            // Parse dữ liệu với BigDecimal
            BigDecimal discountValue = new BigDecimal(discountValueStr);
            BigDecimal minOrderAmount = new BigDecimal(minOrderAmountStr);
            int usageLimit = Integer.parseInt(usageLimitStr);
            BigDecimal maxDiscount = "percentage".equals(discountType) ? new BigDecimal(maxDiscountStr) : BigDecimal.ZERO;
            java.sql.Date expiryDate = java.sql.Date.valueOf(expiryDateStr);

            // Tạo đối tượng Coupon
            Coupon coupon = new Coupon(id, code, discountType, discountValue.doubleValue(), minOrderAmount.doubleValue(),
                    maxDiscount.doubleValue(), usageLimit, originalCoupon.getUsed_count(), expiryDate,
                    originalCoupon.getCreated_at(), status);

            // Cập nhật coupon
            if (couponDAO.updateCoupon(coupon)) {
                response.sendRedirect("couponlist?success=edit");
            } else {
                setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                        maxDiscountStr, usageLimitStr, expiryDateStr, status);
                request.setAttribute("error", "Không thể cập nhật mã giảm giá. Vui lòng thử lại.");
                request.setAttribute("coupon", originalCoupon);
                request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            }
        } catch (NumberFormatException | ArithmeticException e) {
            setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                    maxDiscountStr, usageLimitStr, expiryDateStr, status);
            request.setAttribute("error", "Dữ liệu số không hợp lệ. Vui lòng kiểm tra lại.");
            request.setAttribute("coupon", originalCoupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                    maxDiscountStr, usageLimitStr, expiryDateStr, status);
            request.setAttribute("error", "Ngày không hợp lệ. Vui lòng kiểm tra lại định dạng ngày.");
            request.setAttribute("coupon", originalCoupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
        } catch (Exception e) {
            setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                    maxDiscountStr, usageLimitStr, expiryDateStr, status);
            request.setAttribute("error", "Đã xảy ra lỗi không mong muốn: " + e.getMessage());
            request.setAttribute("coupon", originalCoupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
        }
    }

    private boolean validateCouponData(CouponDAO couponDAO, String code, String discountType,
            String discountValueStr, String minOrderAmountStr, String maxDiscountStr,
            String usageLimitStr, String expiryDateStr, String originalCode, StringBuilder errorMessages) {
        boolean isValid = true;

        // Kiểm tra mã giảm giá
        if (code == null || code.trim().isEmpty() || !code.matches("^[A-Za-z0-9_]+$") || code.length() < 3 || code.length() > 20) {
            errorMessages.append("Mã giảm giá chỉ chứa chữ cái, số, dấu gạch dưới và có độ dài từ 3-20 ký tự.<br>");
            isValid = false;
        } else if (couponDAO.isCouponCodeExists(code) && !code.equals(originalCode)) {
            errorMessages.append("Mã giảm giá đã tồn tại.<br>");
            isValid = false;
        }

        // Kiểm tra loại giảm giá
        if (!"percentage".equals(discountType) && !"fixed".equals(discountType)) {
            errorMessages.append("Loại giảm giá không hợp lệ.<br>");
            isValid = false;
        }

        try {
            // Parse và kiểm tra giá trị
            BigDecimal discountValue = new BigDecimal(discountValueStr);
            BigDecimal minOrderAmount = new BigDecimal(minOrderAmountStr);
            int usageLimit = Integer.parseInt(usageLimitStr);
            BigDecimal maxDiscount = "percentage".equals(discountType) ? new BigDecimal(maxDiscountStr) : BigDecimal.ZERO;

            if ("percentage".equals(discountType)) {
                if (discountValue.compareTo(BigDecimal.ZERO) <= 0 || discountValue.compareTo(MAX_PERCENTAGE) > 0) {
                    errorMessages.append("Giá trị giảm giá theo phần trăm phải từ 1-50%.<br>");
                    isValid = false;
                }
                if (maxDiscount.compareTo(MIN_AMOUNT) < 0 || maxDiscount.compareTo(MAX_AMOUNT) > 0) {
                    errorMessages.append("Giảm tối đa phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                    isValid = false;
                } else if (maxDiscount.compareTo(discountValue) < 0) {
                    errorMessages.append("Giảm tối đa không thể nhỏ hơn phần trăm giảm giá.<br>");
                    isValid = false;
                }
            } else if ("fixed".equals(discountType)) {
                if (discountValue.compareTo(MIN_AMOUNT) < 0 || discountValue.compareTo(MAX_AMOUNT) > 0) {
                    errorMessages.append("Giá trị giảm giá cố định phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                    isValid = false;
                }
            }

            if (minOrderAmount.compareTo(MIN_AMOUNT) < 0 || minOrderAmount.compareTo(MAX_AMOUNT) > 0) {
                errorMessages.append("Giá trị đơn hàng tối thiểu phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                isValid = false;
            }

            if (usageLimit <= 0 || usageLimit > MAX_USAGE_LIMIT) {
                errorMessages.append("Số lần sử dụng tối đa phải từ 1 đến 1.000.000 lần.<br>");
                isValid = false;
            }

            java.sql.Date expiryDate = java.sql.Date.valueOf(expiryDateStr);
            if (expiryDate.before(new Date())) {
                errorMessages.append("Ngày hết hạn phải lớn hơn thời gian hiện tại.<br>");
                isValid = false;
            }
        } catch (NumberFormatException | ArithmeticException e) {
            errorMessages.append("Dữ liệu số không hợp lệ. Vui lòng kiểm tra lại.<br>");
            isValid = false;
        } catch (IllegalArgumentException e) {
            errorMessages.append("Ngày không hợp lệ. Vui lòng kiểm tra lại định dạng ngày.<br>");
            isValid = false;
        }

        return isValid;
    }

    private void setFormAttributes(HttpServletRequest request, int id, String code, String discountType,
            String discountValueStr, String minOrderAmountStr, String maxDiscountStr,
            String usageLimitStr, String expiryDateStr, String status) {
        request.setAttribute("id", id);
        request.setAttribute("code", code);
        request.setAttribute("discount_type", discountType);
        request.setAttribute("discount_value", discountValueStr);
        request.setAttribute("min_order_amount", minOrderAmountStr);
        request.setAttribute("max_discount", maxDiscountStr);
        request.setAttribute("usage_limit", usageLimitStr);
        request.setAttribute("expiry_date", expiryDateStr);
        request.setAttribute("status", status);
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
