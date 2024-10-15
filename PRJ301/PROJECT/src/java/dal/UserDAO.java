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
    public User login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (
                //                Connection connection = getConnection(); // Sử dụng getConnection từ DBContext
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String hashedPassword = resultSet.getString("password");
                if (BCrypt.checkpw(password, hashedPassword)) {
                    return new User(
                            resultSet.getInt("user_id"),
                            resultSet.getString("username"),
                            resultSet.getString("email"),
                            resultSet.getString("phone"),
                            resultSet.getString("address"),
                            resultSet.getString("role"),
                            resultSet.getString("avt_url")
                    );
                }
            }
            return null; // Tài khoản không tồn tại hoặc mật khẩu không đúng
        }
    }

    // Phương thức đăng ký người dùng
    public boolean register(User user) throws SQLException {
        String sql = "INSERT INTO users (username, password, email, phone, address, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (
                //                Connection connection = getConnection(); // Sử dụng getConnection từ DBContext
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt())); // Mã hóa mật khẩu
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getAddress());
            statement.setString(6, user.getRole());
            return statement.executeUpdate() > 0; // Trả về true nếu đăng ký thành công
        }
    }

    // Phương thức lấy tất cả người dùng
    public List<User> getAll() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (
                //                Connection connection = getConnection(); // Sử dụng getConnection từ DBContext
                PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                users.add(new User(
                        resultSet.getInt("user_id"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("role"),
                        resultSet.getString("avt_url")
                ));
            }
        }
        return users; // Trả về danh sách người dùng
    }

    // Phương thức xóa người dùng
    public boolean deleteUser(int userId) throws SQLException {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (
                //                Connection connection = getConnection(); // Sử dụng getConnection từ DBContext
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            return statement.executeUpdate() > 0; // Trả về true nếu xóa thành công
        }
    }

    // Phương thức cập nhật thông tin người dùng
    public boolean updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET username = ?, email = ?, phone = ?, address = ?, role = ?, avt_url = ? WHERE user_id = ?";
        try (
                //                Connection connection = getConnection(); // Sử dụng getConnection từ DBContext
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getRole());
            statement.setString(6, user.getAvtUrl());
            statement.setInt(7, user.getUserId());
            return statement.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        }
    }
}
