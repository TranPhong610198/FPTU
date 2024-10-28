/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.CartItem;
import model.Category;
import model.Product;
import model.SubImage;

/**
 *
 * @author tphon
 */
public class CartDAO extends DBContext {

    // Hàm cập nhật số lượng của sản phẩm trong giỏ hàng
    public void updateCartItemQuantity(int cartItemId, int quantity) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE cart_item_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartItemId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Xóa mục khỏi giỏ hàng
    public void removeItemFromCart(int cartItemId) {
        String sql = "DELETE FROM cart_items WHERE cart_item_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, cartItemId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Thêm một mục vào giỏ hàng
    public void addItemToCart(int cartId, int productId, int quantity) {
        String sql = "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, cartId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Lấy danh sách các mục trong giỏ hàng của người dùng
    public List<CartItem> getCartItems(int userId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT ci.cart_item_id, ci.cart_id, ci.product_id, ci.quantity, "
                + "p.name AS product_name, p.price, p.image_url "
                + "FROM cart_items ci "
                + "JOIN cart c ON ci.cart_id = c.cart_id "
                + "JOIN products p ON ci.product_id = p.product_id "
                + "WHERE c.user_id = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem(
                        rs.getInt("cart_item_id"),
                        rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getString("product_name"),
                        rs.getDouble("price"),// Lấy giá sản phẩm
                        rs.getString("image_url")
                );
                items.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return items;
    }

    public Cart getOrCreateCart(int userId) {
        Cart cart = getCartByUserId(userId); // Kiểm tra xem giỏ hàng có tồn tại không
        if (cart == null) {
            // Nếu chưa có, tạo giỏ hàng mới
            String sql = "INSERT INTO cart (user_id, created_at) VALUES (?, GETDATE())";
            try {
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int cartId = rs.getInt(1);
                    cart = new Cart(cartId, userId);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return cart;
    }

    private Cart getCartByUserId(int userId) {
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Cart(
                        rs.getInt("cart_id"),
                        rs.getInt("user_id"));
            }
        } catch (SQLException e) {

        }
        return null; // Trả về -1 nếu không tìm thấy giỏ hàng
    }
    // Hàm lấy cartId của user (hỗ trợ các hàm khác)

    public int getCartIdByUserId(int userId) {
        String sql = "SELECT cart_id FROM cart WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("cart_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1; // Trả về -1 nếu không tìm thấy giỏ hàng
    }

    // Hàm chuyển giỏ hàng thành đơn hàng khi checkout
    public int transferCartToOrder(int userId, double total) {
        String insertOrderSQL = "INSERT INTO orders (user_id, total, order_status, created_at) VALUES (?, ?, 'Pending', GETDATE())";
        String insertOrderItemSQL = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        String deleteCartItemsSQL = "DELETE FROM cart_items WHERE cart_id = ?";
        int orderId = -1;
        try {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            // Tạo đơn hàng mới
            PreparedStatement orderStmt = connection.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.setDouble(2, total);
            orderStmt.executeUpdate();

            ResultSet orderKeys = orderStmt.getGeneratedKeys();

            if (orderKeys.next()) {
                orderId = orderKeys.getInt(1);
            }

            // Thêm các sản phẩm từ giỏ hàng vào đơn hàng mới
            List<CartItem> cartItems = getCartItems(userId);
            PreparedStatement orderItemStmt = connection.prepareStatement(insertOrderItemSQL);
            for (CartItem item : cartItems) {
                orderItemStmt.setInt(1, orderId);
                orderItemStmt.setInt(2, item.getProductId());
                orderItemStmt.setInt(3, item.getQuantity());
                orderItemStmt.setDouble(4, item.getPrice());
                orderItemStmt.addBatch();
            }
            orderItemStmt.executeBatch();

            // Xóa các mục trong giỏ hàng sau khi chuyển vào đơn hàng
            int cartId = getCartIdByUserId(userId);
            PreparedStatement deleteCartItemsStmt = connection.prepareStatement(deleteCartItemsSQL);
            deleteCartItemsStmt.setInt(1, cartId);
            deleteCartItemsStmt.executeUpdate();

            // Hoàn tất giao dịch
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                System.out.println("Rollback failed: " + ex.getMessage());
            }
            System.out.println(e);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        return orderId;
    }

    public int getCartItemIdbyPId(int productId, int cartId) {
        String query1 = "SELECT ci.cart_item_id FROM cart_items ci, products p \n"
                + "WHERE ci.product_id = p.product_id and\n"
                + "ci.cart_id=? and ci.product_id=? ";
        try {
            PreparedStatement statementQ = connection.prepareStatement(query1);
            statementQ.setInt(1, cartId);
            statementQ.setInt(2, productId);

            ResultSet resultSet = statementQ.executeQuery();
            if (resultSet.next()) {
                int result = resultSet.getInt("cart_item_id");
                return result;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
    
        public int getQuantitybyPId(int productId, int cartId) {
        String query1 = "SELECT ci.quantity FROM cart_items ci, products p \n"
                + "WHERE ci.product_id = p.product_id and\n"
                + "ci.cart_id=? and ci.product_id=? ";
        try {
            PreparedStatement statementQ = connection.prepareStatement(query1);
            statementQ.setInt(1, cartId);
            statementQ.setInt(2, productId);

            ResultSet resultSet = statementQ.executeQuery();
            if (resultSet.next()) {
                int result = resultSet.getInt("quantity");
                return result;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
}
