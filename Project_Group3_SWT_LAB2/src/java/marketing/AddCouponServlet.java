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
import java.util.Date;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddCouponServlet", urlPatterns = {"/marketing/addCoupon"})
public class AddCouponServlet extends HttpServlet {

    private static final double MAX_AMOUNT = 10_000_000; // 10 triệu VNĐ
    private static final int MAX_USAGE_LIMIT = 1_000_000; // 1 triệu lần

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CouponDAO couponDAO = new CouponDAO();
        StringBuilder errorMessages = new StringBuilder();

        String code = request.getParameter("code");
        String discountType = request.getParameter("discount_type");
        String discountValueStr = request.getParameter("discount_value");
        String minOrderAmountStr = request.getParameter("min_order_amount");
        String expiryDateStr = request.getParameter("expiry_date");
        String usageLimitStr = request.getParameter("usage_limit");
        String maxDiscountStr = request.getParameter("max_discount");
        String status = request.getParameter("status") != null ? "active" : "inactive";

        if (!validateCouponData(couponDAO, code, discountType, discountValueStr, minOrderAmountStr,
                maxDiscountStr, usageLimitStr, expiryDateStr, errorMessages)) {
            request.setAttribute("error", errorMessages.toString());
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
            return;
        }

        try {
            // Parse dữ liệu
            double discountValue = Double.parseDouble(discountValueStr);
            double minOrderAmount = Double.parseDouble(minOrderAmountStr);
            int usageLimit = Integer.parseInt(usageLimitStr);
            double maxDiscount = "percentage".equals(discountType) ? Double.parseDouble(maxDiscountStr) : 0;
            java.sql.Date expiryDate = java.sql.Date.valueOf(expiryDateStr);
            java.sql.Date createdAt = new java.sql.Date(new Date().getTime());

            // Tạo đối tượng Coupon
            Coupon coupon = new Coupon(0, code, discountType, discountValue, minOrderAmount,
                    maxDiscount, usageLimit, 0, expiryDate, createdAt, status);

            // Thêm coupon vào DB
            if (couponDAO.addCoupon(coupon)) {
                response.sendRedirect("couponlist?success=add");
            } else {
                request.setAttribute("error", "Không thể thêm mã giảm giá. Vui lòng thử lại.");
                request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Dữ liệu số không hợp lệ. Vui lòng kiểm tra lại.");
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Ngày không hợp lệ. Vui lòng kiểm tra lại định dạng ngày.");
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Đã xảy ra lỗi không mong muốn: " + e.getMessage());
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
        }
    }

    private boolean validateCouponData(CouponDAO couponDAO, String code, String discountType,
            String discountValueStr, String minOrderAmountStr, String maxDiscountStr,
            String usageLimitStr, String expiryDateStr, StringBuilder errorMessages) {
        boolean isValid = true;

        // Kiểm tra mã giảm giá
        if (code == null || code.trim().isEmpty() || !code.matches("^[A-Za-z0-9_]+$") || code.length() < 3 || code.length() > 20) {
            errorMessages.append("Mã giảm giá chỉ chứa chữ cái, số, dấu gạch dưới và có độ dài từ 3-20 ký tự.<br>");
            isValid = false;
        } else if (couponDAO.isCouponCodeExists(code)) {
            errorMessages.append("Mã giảm giá đã tồn tại.<br>");
            isValid = false;
        }

        // Kiểm tra loại giảm giá
        if (!"percentage".equals(discountType) && !"fixed".equals(discountType)) {
            errorMessages.append("Loại giảm giá không hợp lệ.<br>");
            isValid = false;
        }

        try {
            // Kiểm tra giá trị giảm giá
            double discountValue = Double.parseDouble(discountValueStr);
            if ("percentage".equals(discountType)) {
                if (discountValue <= 0 || discountValue > 50) {
                    errorMessages.append("Giá trị giảm giá theo phần trăm phải từ 1-50%.<br>");
                    isValid = false;
                }
                // Kiểm tra giảm tối đa nếu là percentage
                double maxDiscount = Double.parseDouble(maxDiscountStr);
                if (maxDiscount <= 0 || maxDiscount > MAX_AMOUNT) {
                    errorMessages.append("Giảm tối đa phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                    isValid = false;
                } else if (maxDiscount < discountValue) {
                    errorMessages.append("Giảm tối đa không thể nhỏ hơn phần trăm giảm giá.<br>");
                    isValid = false;
                }
            } else if ("fixed".equals(discountType)) {
                if (discountValue < 500 || discountValue > MAX_AMOUNT) {
                    errorMessages.append("Giá trị giảm giá cố định phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                    isValid = false;
                }
            }

            // Kiểm tra giá trị đơn hàng tối thiểu
            double minOrderAmount = Double.parseDouble(minOrderAmountStr);
            if (minOrderAmount < 500 || minOrderAmount > MAX_AMOUNT) {
                errorMessages.append("Giá trị đơn hàng tối thiểu phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                isValid = false;
            }

            // Kiểm tra số lần sử dụng tối đa
            int usageLimit = Integer.parseInt(usageLimitStr);
            if (usageLimit <= 0 || usageLimit > MAX_USAGE_LIMIT) {
                errorMessages.append("Số lần sử dụng tối đa phải từ 1 đến 1.000.000 lần.<br>");
                isValid = false;
            }

            // Kiểm tra ngày hết hạn
            java.sql.Date expiryDate = java.sql.Date.valueOf(expiryDateStr);
            if (expiryDate.before(new Date())) {
                errorMessages.append("Ngày hết hạn phải lớn hơn thời gian hiện tại.<br>");
                isValid = false;
            }
        } catch (NumberFormatException e) {
            errorMessages.append("Dữ liệu số không hợp lệ. Vui lòng kiểm tra lại.<br>");
            isValid = false;
        } catch (IllegalArgumentException e) {
            errorMessages.append("Ngày không hợp lệ. Vui lòng kiểm tra lại định dạng ngày.<br>");
            isValid = false;
        }

        return isValid;
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
