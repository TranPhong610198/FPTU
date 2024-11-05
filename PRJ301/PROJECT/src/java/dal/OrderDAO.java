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
import model.User;

/**
 *
 * @author tphon
 */
public class OrderDAO extends DBContext {

    public double getTotalRevenue() {
        double result = -1;
        String query = "SELECT SUM(o.total) AS total_revenue\n"
                + "FROM orders o\n"
                + "WHERE o.order_status = 'Completed'";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = rs.getDouble("total_revenue");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<User> getTopSpendingUsers() {
        List<User> topUsers = new ArrayList<>();
        String query = "SELECT TOP(3) u.user_id, u.username, u.email, u.phone, SUM(o.total) AS total_spent "
                + "FROM orders o "
                + "JOIN users u ON o.user_id = u.user_id "
                + "WHERE o.order_status = 'Completed' "
                + "GROUP BY u.user_id, u.username, u.email, u.phone "
                + "ORDER BY total_spent DESC ";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setTotalSpent(rs.getDouble("total_spent"));

                topUsers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return topUsers;
    }

    public Map<String, Integer> getOrderStatusCounts() {
        Map<String, Integer> statusCounts = new HashMap<>();
        String query = "SELECT order_status, COUNT(*) AS count "
                + "FROM orders "
                + "GROUP BY order_status";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                statusCounts.put(rs.getString("order_status"), rs.getInt("count"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return statusCounts;
    }

    public List<String> getRevenueDates() {
        List<String> dates = new ArrayList<>();
        String query = "SELECT DISTINCT CONVERT(VARCHAR, created_at, 23) AS date "
                + "FROM orders "
                + "WHERE order_status = 'Completed' "
                + "ORDER BY date";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                dates.add(rs.getString("date"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dates;
    }

    public List<Double> getRevenueAmounts() {
        List<Double> revenues = new ArrayList<>();
        String query = "SELECT CONVERT(VARCHAR, created_at, 23) AS date, SUM(total) AS daily_revenue "
                + "FROM orders "
                + "WHERE order_status = 'Completed' "
                + "GROUP BY CONVERT(VARCHAR, created_at, 23) "
                + "ORDER BY date";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                revenues.add(rs.getDouble("daily_revenue"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return revenues;
    }

//--------------------------------------------------------------------------------------------------------------
    public void updateTotalAmout(double total, int orderId) {
        String query = "UPDATE orders SET total = ? WHERE order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setDouble(1, total);
            statement.setInt(2, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStatusOrder(String status, int orderId) {
        String query = "UPDATE orders SET order_status = ? WHERE order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Order getOrderById(int order_id) {
        String query = "SELECT * FROM orders WHERE order_id = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, order_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Order order = new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total"),
                        rs.getString("order_status"),
                        String.valueOf(rs.getDate("created_at"))
                );
                return order;
            }

        } catch (SQLException e) {
        }
        return null;
    }

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
//        String query = "SELECT oi.*, p.* \n"
//                + "FROM order_items oi, products p \n"
//                + "WHERE p.product_id=oi.product_id AND oi.order_id = ?";
        String query = "SELECT r.ram_size, oi.*, p.*\n"
                + "FROM order_items oi \n"
                + "JOIN products p ON p.product_id=oi.product_id\n"
                + "LEFT JOIN ram r ON r.ram_id = oi.ram_id\n"
                + "WHERE oi.order_id = ?";

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
                item.setRamId(rs.getInt("ram_id"));
                item.setRamSize(rs.getString("ram_size"));
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
                item.setRamId(rs.getInt("ram_id"));
                items.add(item);
            }
        } catch (Exception e) {
        }
        return items;
    }

    public Statistic getStatByPid(int productId) {
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

    public void updateSatistic(int productId, int stock, int quantity, double totalPrice, Statistic oldStat) {
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
        String query2 = "UPDATE statisticsTable SET total_sales = ?, revenue = ? WHERE product_id = ?";
        try {
            PreparedStatement statement2 = connection.prepareStatement(query2);
            statement2.setInt(3, productId);
            statement2.setInt(1, quantity + oldStat.getTotalSale());
            statement2.setBigDecimal(2, BigDecimal.valueOf(totalPrice + oldStat.getRevenue()));
            statement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addSatistic(int productId, int stock, int quantity, double totalPrice) {
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
            statement2.setBigDecimal(3, BigDecimal.valueOf(totalPrice));
            statement2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
