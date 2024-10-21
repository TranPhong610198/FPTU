/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author tphon
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO extends DBContext {

    // Phương thức kiểm tra đăng nhập
    public User login(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String hashedPassword = resultSet.getString("password");
                if (BCrypt.checkpw(password, hashedPassword)) {
                    return new User(
                            resultSet.getInt("user_id"),
                            resultSet.getString("username"),
                            resultSet.getString("password"),
                            resultSet.getString("email"),
                            resultSet.getString("phone"),
                            resultSet.getString("address"),
                            resultSet.getString("role"),
                            resultSet.getString("avt_url"),
                            resultSet.getBoolean("isBlocked")
                    );
                }
            }
            return null; // Tài khoản không tồn tại hoặc mật khẩu không đúng
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }

    // Phương thức đăng ký người dùng
    public void register(User user) throws SQLException {
        String sql = "INSERT INTO users (username, password, email, phone, address, role) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt())); // Mã hóa mật khẩu
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getAddress());
            statement.setString(6, user.getRole());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Phương thức lấy tất cả người dùng
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                users.add(new User(
                        resultSet.getInt("user_id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("role"),
                        resultSet.getString("avt_url"),
                        resultSet.getBoolean("isBlocked")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }

    // Phương thức xóa người dùng
    public void deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Phương thức cập nhật thông tin người dùng
    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET username = ?, email = ?, phone = ?, address = ?, role = ?, avt_url = ? WHERE user_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getRole());
            statement.setString(6, user.getAvtUrl());
            statement.setInt(7, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE user_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new User(
                        resultSet.getInt("user_id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("role"),
                        resultSet.getString("avt_url"),
                        resultSet.getBoolean("isBlocked")
                );
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public void blockUser(int userId, boolean block) {
        String query = "UPDATE users SET isBlocked = ? WHERE user_id = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setBoolean(1, block);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateRole(int userId, String newRole) {
        String query = "UPDATE users SET role = ? WHERE user_id = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, newRole);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void resetPassword(int userId, String newPassword) {
        // Giả sử bạn đã sử dụng Bcrypt để mã hóa mật khẩu
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        String query = "UPDATE users SET password = ? WHERE user_id = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, hashedPassword);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

}
