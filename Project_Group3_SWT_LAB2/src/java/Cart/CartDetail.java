package Cart;

import DAO.CartDAO;
import DAO.CouponDAO;
import entity.Cart;
import entity.CartItem;
import entity.Coupon;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CartDetail", urlPatterns = {"/cartdetail"})
public class CartDetail extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();
    private CouponDAO couponDAO = new CouponDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Get cart (works for both logged in and non-logged in users)
        Cart cart = user != null
                ? cartDAO.getCart(request, user.getId())
                : cartDAO.getCart(request, null);

        // Get available coupons
        List<Coupon> availableCoupons = couponDAO.getAvailableCoupons();
        request.setAttribute("availableCoupons", availableCoupons);

        setupCartAttributes(request, cart);
        request.getRequestDispatcher("cartdetail.jsp").forward(request, response);
    }

    private void setupCartAttributes(HttpServletRequest request, Cart cart) {
        double totalAmount = cartDAO.calculateTotalAmount(cart);
        double discount = calculateDiscount(request, totalAmount);

        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("discount", discount);
        request.setAttribute("finalAmount", totalAmount - discount);

        String appliedCoupon = (String) request.getSession().getAttribute("appliedCoupon");
        if (appliedCoupon != null) {
            request.setAttribute("appliedCoupon", appliedCoupon);
            Coupon couponDetails = couponDAO.getCouponByCode(appliedCoupon);
            if (couponDetails != null) {
                request.setAttribute("appliedCouponDetails", couponDetails);
            }
        }
    }

    private double calculateDiscount(HttpServletRequest request, double totalAmount) {
        HttpSession session = request.getSession();
        String appliedCoupon = (String) session.getAttribute("appliedCoupon");

        if (appliedCoupon != null) {
            try {
                return validateAndCalculateCouponDiscount(appliedCoupon, totalAmount);
            } catch (Exception e) {
                session.removeAttribute("appliedCoupon");
                session.removeAttribute("cartDiscount");
                request.setAttribute("couponError", e.getMessage());
            }
        }
        return 0.0;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get action type from request
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if ("update".equals(action)) {
            handleUpdateQuantity(request, response, user);
        } else if ("delete".equals(action)) {
            handleDeleteItem(request, response);
        } else if ("applyCoupon".equals(action)) {
            handleApplyCoupon(request, response);
            return;
        } else if ("checkout".equals(action)) {
//            if (user == null) {
//                // Save current URL to redirect back after login
//                String currentURL = request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
//                session.setAttribute("redirectAfterLogin", currentURL);
//
//                // Redirect to login for checkout
//                response.sendRedirect("login");
//                return;
//            }

            handleCheckout(request, response);
            return;
        }

        response.sendRedirect("cartdetail");
    }

    private void handleCheckout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Lấy danh sách sản phẩm được chọn
        String[] selectedIds = request.getParameterValues("selectedItems");

        if (selectedIds == null || selectedIds.length == 0) {
            request.setAttribute("error", "Vui lòng chọn sản phẩm");
            doGet(request, response);
            return;
        }

        // Tạo danh sách lưu ID và số lượng
        List<String> selectedItemIds = new ArrayList<>();
        List<String> selectedQuantities = new ArrayList<>();

        // Lấy số lượng tương ứng cho từng sản phẩm được chọn
        for (String itemId : selectedIds) {
            String quantity = request.getParameter("quantity_" + itemId);
            selectedItemIds.add(itemId);
            selectedQuantities.add(quantity);
        }

        // Lưu vào session các sản phẩm được chọn
        session.setAttribute("selectedItemIds", selectedItemIds);
        session.setAttribute("selectedQuantities", selectedQuantities);

        // Lưu thông tin giảm giá hiện tại vào session
        String currentCoupon = request.getParameter("couponCode");
        if (currentCoupon != null && !currentCoupon.isEmpty()) {
            // Tính lại giảm giá dựa trên tổng tiền của các sản phẩm được chọn
            User user = (User) session.getAttribute("acc");
            Cart cart = user != null
                    ? cartDAO.getCartByUserId(user.getId())
                    : cartDAO.getCartFromCookies(request);

            double totalSelected = 0;
            for (int i = 0; i < selectedIds.length; i++) {
                for (CartItem item : cart.getItems()) {
                    if (String.valueOf(item.getId()).equals(selectedIds[i])) {
                        totalSelected += item.getProductPrice()
                                * Integer.parseInt(request.getParameter("quantity_" + selectedIds[i]));
                        break;
                    }
                }
            }

            try {
                double discount = validateAndCalculateCouponDiscount(currentCoupon, totalSelected);
                session.setAttribute("cartDiscount", discount);
                session.setAttribute("appliedCoupon", currentCoupon);
            } catch (Exception e) {
                session.removeAttribute("cartDiscount");
                session.removeAttribute("appliedCoupon");
            }
        }

        // Chuyển hướng sang trang contact mà không kiểm tra đăng nhập
        response.sendRedirect("cartcontact");
    }

    private void handleUpdateQuantity(HttpServletRequest request, HttpServletResponse response, User user) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            System.out.println("Updating cart item: " + cartItemId + " with quantity: " + quantity);

            if (user != null) {
                // User is logged in, update in database
                boolean success = cartDAO.updateCartItemQuantity(cartItemId, quantity);
                if (!success) {
                    System.out.println("Failed to update cart item quantity in database");
                }
            } else {
                // User is not logged in, update in cookies
                cartDAO.updateCartItemQuantityInCookie(request, response, cartItemId, quantity);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing quantity: " + e.getMessage());
            System.out.println("cartItemId: " + request.getParameter("cartItemId"));
            System.out.println("quantity: " + request.getParameter("quantity"));
        }
    }

    // Trong CartDetail.java
    private void handleDeleteItem(HttpServletRequest request, HttpServletResponse response) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("acc");

            if (user != null) {
                // Người dùng đã đăng nhập, xóa từ database
                cartDAO.deleteCartItem(request, response, cartItemId, cartItemId);
            } else {
                // Người dùng chưa đăng nhập, xóa từ cookie
                cartDAO.deleteCartItemFromCookie(request, response, cartItemId);
            }
        } catch (NumberFormatException e) {
            System.out.println("Lỗi khi parse ID sản phẩm: " + e.getMessage());
        }
    }

    private void handleApplyCoupon(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String couponCode = request.getParameter("couponCode");

        User user = (User) session.getAttribute("acc");
        Cart cart = cartDAO.getCart(request, user != null ? user.getId() : null);

        if (couponCode == null || couponCode.trim().isEmpty()) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            response.sendRedirect("cartdetail");
            return;
        }

        try {
            double totalAmount = cartDAO.calculateTotalAmount(cart);
            double discount = validateAndCalculateCouponDiscount(couponCode, totalAmount);

            session.setAttribute("appliedCoupon", couponCode);
            session.setAttribute("cartDiscount", discount);
        } catch (Exception e) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            request.setAttribute("couponError", e.getMessage());
        }

        response.sendRedirect("cartdetail");
    }

    private double validateAndCalculateCouponDiscount(String couponCode, double totalAmount) throws Exception {
        Coupon coupon = couponDAO.getCouponByCode(couponCode);

        if (coupon == null) {
            throw new Exception("Mã giảm giá không tồn tại!");
        }

        if (!"active".equals(coupon.getStatus())) {
            throw new Exception("Mã giảm giá không còn hiệu lực!");
        }

        Date expiryDate = coupon.getExpiry_date();
        if (expiryDate != null) {
            Date currentDate = new Date(System.currentTimeMillis());
            if (currentDate.after(expiryDate)) {
                throw new Exception("Mã giảm giá đã hết hạn!");
            }
        }

        Integer usageLimit = coupon.getUsage_limit();
        if (usageLimit != null && usageLimit > 0) {
            int usedCount = coupon.getUsed_count();
            if (usedCount >= usageLimit) {
                throw new Exception("Mã giảm giá đã hết lượt sử dụng!");
            }
        }

        if (totalAmount < coupon.getMin_order_amount()) {
            throw new Exception(String.format("Đơn hàng cần tối thiểu %,.0f₫ để áp dụng mã này!",
                    coupon.getMin_order_amount()));
        }

        double discount;
        if ("percentage".equals(coupon.getDiscount_type())) {
            discount = totalAmount * (coupon.getDiscount_value() / 100);
            if (coupon.getMax_discount() > 0 && discount > coupon.getMax_discount()) {
                discount = coupon.getMax_discount();
            }
        } else {
            discount = coupon.getDiscount_value();
        }

        return discount;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
