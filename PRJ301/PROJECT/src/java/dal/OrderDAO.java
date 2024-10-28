/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;
import model.OrderItem;
import model.Statistic;

/**
 *
 * @author tphon
 */
public class OrderDAO extends DBContext {

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
            statement1.setInt(1, stock-quantity);
            statement1.executeUpdate();
        } catch (Exception e) {
        }
        
        //Chỉnh sửa statistic
        String query2 = "UPDATE statisticsTable SET total-sales = ?, revenue = ? WHERE product_id = ?";
        try {
            PreparedStatement statement2 = connection.prepareStatement(query2);
            statement2.setInt(1, productId);
            statement2.setInt(2, quantity+ oldStat.getTotalSale());
            statement2.setBigDecimal(3, BigDecimal.valueOf(totalAmount + oldStat.getRevenue()));
            statement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Thay đổi status order
        String query3 = "UPDATE orders SET order_status = ? WHERE order_id = ?";
        try {
            PreparedStatement statement3 = connection.prepareStatement(query3);
            statement3.setString(1, "completed");
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
            statement1.setInt(1, stock-quantity);
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
            statement3.setString(1, "completed");
            statement3.setInt(2, orderId);
            statement3.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
