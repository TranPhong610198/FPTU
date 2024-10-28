/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

/**
 *
 * @author tphon
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            double total = 0.00;
            int userId = user.getId();

            CartDAO cd = new CartDAO();
            try {
                Cart cart = cd.getOrCreateCart(userId); // Lấy hoặc tạo giỏ hàng nếu chưa có
                List<CartItem> cartItems = cd.getCartItems(cart.getUser_id());
                for (CartItem temp : cartItems) {
                    total += temp.getPrice() * temp.getQuantity();
                }
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("total", total);
            } catch (Exception e) {
                e.printStackTrace();
            }

            //Lấy từ cookie các sản phẩm vừa xem
            String valueCookie = "";
            boolean isSelect = false;
            
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("selectedP".equals(cookie.getName())) {
                        valueCookie = cookie.getValue();
                        isSelect = true;
                        break;
                    }
                }
                if (isSelect) {
                    ProductDAO pd = new ProductDAO();
                    List<Product> products = new ArrayList<>();
                    String[] ProductIds = valueCookie.split("/");
                    for (String productId_raw : ProductIds){
                        int productId = Integer.parseInt(productId_raw);
                        Product temp = pd.getProductByID(productId);
                        products.add(temp);
                    }
                    request.setAttribute("recentList", products);
                }
            }
            //_______________________________________________________________________________________

            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }
        CartDAO cd = new CartDAO();
        User user = (User) request.getSession().getAttribute("account");
        int productId, quantity, cartId, cartItemId;
        if (user == null) {
            response.sendRedirect("login");
        } else {
            try {
                int userId = user.getId();
                switch (action) {
                    case "add":
                        productId = Integer.parseInt(request.getParameter("productId"));
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                        cartId = cd.getCartIdByUserId(userId);
                        int temp = cd.getCartItemIdbyPId(productId, cartId);
                        if (temp != -1) {
                            int oldQuantity = cd.getQuantitybyPId(productId, cartId);
                            cd.updateCartItemQuantity(temp, quantity + oldQuantity);
                        } else {
                            cd.addItemToCart(cartId, productId, quantity);
                        }
                        response.sendRedirect("cart");
                        break;

                    case "remove":
                        cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                        cd.removeItemFromCart(cartItemId);
                        response.sendRedirect("cart");
                        break;

                    case "update":
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                        cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                        cd.updateCartItemQuantity(cartItemId, quantity);
                        response.sendRedirect("cart");
                        break;

                    case "checkout":
                        double total = Double.parseDouble(request.getParameter("total"));
                        int orderId = cd.transferCartToOrder(userId, total);
//                        request.setAttribute("orderId", orderId);
//                        request.setAttribute("total", total);
//                        request.getRequestDispatcher("payment").forward(request, response);
                        response.sendRedirect("payment?orderId="+orderId+"&total="+total);
                        break;

                    default:
                        throw new ServletException("Invalid action");
                }

            } catch (IOException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
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
