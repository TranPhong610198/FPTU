/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;
import model.Order;
import model.OrderItem;
import model.Product;
import model.Statistic;

/**
 *
 * @author tphon
 */
public class OrderDAO extends DBContext {

    public void deleteOrder(int orderId) {
        String query1 = "DELETE FROM order_items WHERE order_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query1)) {
            statement.setInt(1, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String query2 = "DELETE FROM orders WHERE order_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query2)) {
            statement.setInt(1, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderItem> getDetailOrder(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String query = "SELECT oi.*, p.* \n"
                + "FROM order_items oi, products p \n"
                + "WHERE p.product_id=oi.product_id AND oi.order_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getBigDecimal("price"),
                        rs.getInt("stock"),
                        rs.getInt("brand_id"),
                        rs.getInt("category_id"),
                        rs.getString("image_url"));
                OrderItem item = new OrderItem(
                        rs.getInt("order_item_id"),
                        rs.getInt("order_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        product
                );
                items.add(item);
            }
        } catch (Exception e) {
        }
        return items;
    }

    public List<Order> getAllOrder(int user_id) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE 1=1";

        try {
            if (user_id != -1) {
                query += "AND user_id =" + user_id;
            }
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total"),
                        rs.getString("order_status"),
                        String.valueOf(rs.getDate("created_at"))
                );
                orders.add(order);
            }
        } catch (SQLException e) {
        }
        return orders;
    }

    public List<OrderItem> getListItemInOrder(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String query = "SELECT * FROM order_items WHERE order_id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OrderItem item = new OrderItem(
                        rs.getInt("order_item_id"),
                        rs.getInt("order_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                );
                items.add(item);
            }
        } catch (Exception e) {
        }
        return items;
    }

    public Statistic checkProductIdInStat(int productId) {
        String query = "SELECT * FROM statisticsTable WHERE product_id=?";
        try {
            PreparedStatement statementQ = connection.prepareStatement(query);
            statementQ.setInt(1, productId);

            ResultSet resultSet = statementQ.executeQuery();
            if (resultSet.next()) {
                return new Statistic(resultSet.getInt("stat_id"),
                        resultSet.getInt("product_id"),
                        resultSet.getInt("total_sales"),
                        resultSet.getDouble("revenue")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateSatistic(int productId, int quantity, double totalAmount, Statistic oldStat, int stock, int orderId) {
        //Giảm sản phẩm còn lại
        String query1 = "UPDATE products SET stock = ? WHERE product_id = ?";
        try {
            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(2, productId);
            statement1.setInt(1, stock - quantity);
            statement1.executeUpdate();
        } catch (Exception e) {
        }

        //Chỉnh sửa statistic
        String query2 = "UPDATE statisticsTable SET total-sales = ?, revenue = ? WHERE product_id = ?";
        try {
            PreparedStatement statement2 = connection.prepareStatement(query2);
            statement2.setInt(1, productId);
            statement2.setInt(2, quantity + oldStat.getTotalSale());
            statement2.setBigDecimal(3, BigDecimal.valueOf(totalAmount + oldStat.getRevenue()));
            statement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Thay đổi status order
        String query3 = "UPDATE orders SET order_status = ? WHERE order_id = ?";
        try {
            PreparedStatement statement3 = connection.prepareStatement(query3);
            statement3.setString(1, "Processing");
            statement3.setInt(2, orderId);
            statement3.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addSatistic(int productId, int quantity, double totalAmount, int stock, int orderId) {
        //Giảm sản phẩm còn lại
        String query1 = "UPDATE products SET stock = ? WHERE product_id = ?";
        try {
            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(2, productId);
            statement1.setInt(1, stock - quantity);
            statement1.executeUpdate();
        } catch (Exception e) {
        }

        //Chỉnh sửa statistic
        String query2 = "INSERT INTO statisticsTable (product_id, total_sales, revenue) VALUES (?, ?, ?)";
        try {
            PreparedStatement statement2 = connection.prepareStatement(query2);
            statement2.setInt(1, productId);
            statement2.setInt(2, quantity);
            statement2.setBigDecimal(3, BigDecimal.valueOf(totalAmount));
            statement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Thay đổi status order
        String query3 = "UPDATE orders SET order_status = ? WHERE order_id = ?";
        try {
            PreparedStatement statement3 = connection.prepareStatement(query3);
            statement3.setString(1, "Processcing");
            statement3.setInt(2, orderId);
            statement3.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
