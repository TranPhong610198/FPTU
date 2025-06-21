package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.User;
import Context.DBContext;
import entity.UserAddress;
import java.io.File;

import java.util.ArrayList;
import java.util.List;
import utils.BCrypt;

/**
 *
 * @author nguye
 */
public class UserDAO extends DBContext {

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public User loginByUsername(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String storedHash = rs.getString("password_hash");
                if (BCrypt.checkpw(password, storedHash)) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            storedHash,
                            rs.getString("full_name"),
                            rs.getString("gender"),
                            rs.getString("mobile"),
                            rs.getString("avatar"),
                            rs.getString("role"),
                            rs.getString("status"),
                            rs.getString("created_at"),
                            rs.getString("updated_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User loginByEmail(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String storedHash = rs.getString("password_hash");
                if (BCrypt.checkpw(password, storedHash)) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            storedHash,
                            rs.getString("full_name"),
                            rs.getString("gender"),
                            rs.getString("mobile"),
                            rs.getString("avatar"),
                            rs.getString("role"),
                            rs.getString("status"),
                            rs.getString("created_at"),
                            rs.getString("updated_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public User checkExistUsername(String username) {
        String sql = "select * from users\n"
                + "where Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkExistEmail(String email) {
        String sql = "select * from users\n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkExistPhone(String mobile) {
        String sql = "select * from users\n"
                + "where mobile = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mobile);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public int insertUserWithPendingStatus(User user) {
        String sql = "INSERT INTO users (username, email, password_hash, full_name, gender, mobile, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, 'customer', 'pending')";
        try (PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPasswordHash());
            st.setString(4, user.getFullName());
            st.setString(5, user.getGender());
            st.setString(6, user.getMobile());

            int InsertedRow = st.executeUpdate();
            if (InsertedRow > 0) {
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public boolean activateUser(int userId) {
        String sql = "UPDATE users SET status = 'active' WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password_hash"),
                            rs.getString("full_name"),
                            rs.getString("gender"),
                            rs.getString("mobile"),
                            rs.getString("avatar"),
                            rs.getString("role"),
                            rs.getString("status"),
                            rs.getString("created_at"),
                            rs.getString("updated_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public String generateUniqueUsername(String baseUsername) {
        String username = baseUsername;
        int counter = 1;
        UserDAO UserDAO = new UserDAO();
        while (UserDAO.checkExistUsername(username) != null) {
            username = baseUsername + counter;
            counter++;
        }

        return username;
    }

    public void insertGoogleUser(String googleId, String email, String fullName, String picture) {
        String sql = "INSERT INTO users (username, email, password_hash, full_name, gender, avatar, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Tách username từ @ trc email 
            String baseUsername = email.substring(0, email.indexOf('@'));
            String username = generateUniqueUsername(baseUsername);

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, "accGoogle" + BCrypt.hashpw(googleId, BCrypt.gensalt()));
            st.setString(4, fullName);
            st.setString(5, "other");
            st.setString(6, picture);
            st.setString(7, "customer");
            st.setString(8, "active");

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE users SET password_hash =?, updated_at = GETDATE() WHERE id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
            st.setString(1, hashedPassword);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE users SET full_name=?, gender=?, mobile=?, avatar=?, updated_at=GETDATE() WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullName());
            st.setString(2, user.getGender());
            st.setString(3, user.getMobile());
            st.setString(4, user.getAvatar());
            st.setInt(5, user.getId());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean updateProfile(User user) {
        String sql = "UPDATE users SET full_name=?, gender=?, mobile=?, updated_at=GETDATE()  WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullName());
            st.setString(2, user.getGender());
            st.setInt(4, user.getId());
            st.setString(3, user.getMobile());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public List<UserAddress> getUserAddresses(int userId) {
        List<UserAddress> addresses = new ArrayList<>();
        String sql = "SELECT * FROM user_addresses WHERE user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserAddress address = new UserAddress(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("recipient_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getBoolean("is_default")
                );
                addresses.add(address);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return addresses;
    }

    public boolean addUserAddress(UserAddress address) {
        // Kiểm tra xem người dùng đã có địa chỉ nào chưa
        String checkExistingAddresses = "SELECT COUNT(*) FROM user_addresses WHERE user_id = ?";
        String sql = "INSERT INTO user_addresses (user_id, recipient_name, phone, address, is_default) VALUES (?, ?, ?, ?, ?)";

        try {
            // Kiểm tra số lượng địa chỉ hiện có
            PreparedStatement checkStmt = connection.prepareStatement(checkExistingAddresses);
            checkStmt.setInt(1, address.getUserId());
            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            int addressCount = rs.getInt(1);

            // Nếu là địa chỉ đầu tiên hoặc đã chọn là địa chỉ mặc định
            boolean shouldBeDefault = addressCount == 0 || address.isDefault();

            // Nếu sẽ set làm mặc định, clear các địa chỉ mặc định khác
            if (shouldBeDefault) {
                String clearDefaults = "UPDATE user_addresses SET is_default = 0 WHERE user_id = ?";
                PreparedStatement clearStmt = connection.prepareStatement(clearDefaults);
                clearStmt.setInt(1, address.getUserId());
                clearStmt.executeUpdate();
            }

            // Thêm địa chỉ mới
            PreparedStatement insertStmt = connection.prepareStatement(sql);
            insertStmt.setInt(1, address.getUserId());
            insertStmt.setString(2, address.getRecipientName());
            insertStmt.setString(3, address.getPhone());
            insertStmt.setString(4, address.getAddress());
            insertStmt.setBoolean(5, shouldBeDefault);  // Sử dụng shouldBeDefault thay vì address.isDefault()

            return insertStmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUserAddress(int addressId, int userId) {
        String sql = "DELETE FROM user_addresses WHERE id = ? AND user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, addressId);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean setDefaultAddress(int addressId, int userId) {
        // First clear all default addresses for this user
        String clearDefaults = "UPDATE user_addresses SET is_default = 0 WHERE user_id = ?";
        String setDefault = "UPDATE user_addresses SET is_default = 1 WHERE id = ? AND user_id = ?";

        try {
            // Start transaction
            connection.setAutoCommit(false);

            try (PreparedStatement st1 = connection.prepareStatement(clearDefaults); PreparedStatement st2 = connection.prepareStatement(setDefault)) {

                // Clear all defaults first
                st1.setInt(1, userId);
                st1.executeUpdate();

                // Set the new default
                st2.setInt(1, addressId);
                st2.setInt(2, userId);
                int result = st2.executeUpdate();

                // Commit transaction
                connection.commit();
                return result > 0;
            }
        } catch (SQLException e) {
            // Rollback in case of error
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void unsetDefaultAddress(int userId, int addressId) {
        String query = "UPDATE user_addresses SET is_default = 0 WHERE id = ? AND user_id = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, addressId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateAvatar(int userId, String avatarPath) {
        String sql = "UPDATE users SET avatar = ?, updated_at = GETDATE() WHERE id = ?;";
        try (
                PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, avatarPath);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();  // Ghi log lỗi thay vì chỉ in
            return false;
        }
    }

///////VTD
    public List<User> getUsersByFilter(String sql, List<Object> params) {
        List<User> users = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                st.setObject(i + 1, params.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("full_name"),
                        rs.getString("gender"),
                        rs.getString("mobile"),
                        rs.getString("avatar"),
                        rs.getString("role"),
                        rs.getString("status"),
                        rs.getString("created_at"),
                        rs.getString("updated_at")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getTotalFilteredRecords(String sql, List<Object> params) {
        // Chuyển đổi câu SQL để đếm tổng số bản ghi
        String countSql = sql.replaceFirst("SELECT \\*", "SELECT COUNT(*)");
        // Loại bỏ phần ORDER BY và OFFSET ... FETCH
        int orderByIndex = countSql.toLowerCase().indexOf("order by");
        if (orderByIndex != -1) {
            countSql = countSql.substring(0, orderByIndex);
        }
        int offsetIndex = countSql.toLowerCase().indexOf("offset");
        if (offsetIndex != -1) {
            countSql = countSql.substring(0, offsetIndex);
        }

        try (PreparedStatement st = connection.prepareStatement(countSql)) {
            // Set parameters (bỏ qua 2 tham số cuối cùng là offset và limit)
            for (int i = 0; i < params.size() - 2; i++) {
                st.setObject(i + 1, params.get(i));
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private void deleteAvatarFile(int userID) throws SQLException {
        String getAvatarSql = "SELECT avatar FROM users WHERE ID = ?";
        try (PreparedStatement st = connection.prepareStatement(getAvatarSql)) {
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String avatarPath = rs.getString("avatar");
                if (avatarPath != null) {
                    String realPath = new File("").getAbsolutePath() + File.separator + avatarPath;
                    File avatarFile = new File(realPath);
                    if (avatarFile.exists()) {
                        avatarFile.delete();
                    }
                }
            }
        }
    }

    public boolean deleteUser(int userID) {
        try {
            connection.setAutoCommit(false);

            String[] deleteQueries = {
                // Delete feedback
                "DELETE FROM feedback WHERE user_id = ?",
                // Delete cart items and cart
                "DELETE FROM cart_items WHERE cart_id IN (SELECT id FROM cart WHERE user_id = ?)",
                "DELETE FROM cart WHERE user_id = ?",
                // Delete order related
                "DELETE FROM order_history WHERE updated_by = ?",
                "DELETE FROM payments WHERE order_id IN (SELECT id FROM orders WHERE user_id = ?)",
                "DELETE FROM shipping WHERE order_id IN (SELECT id FROM orders WHERE user_id = ?)",
                "DELETE FROM order_coupons WHERE order_id IN (SELECT id FROM orders WHERE user_id = ?)",
                "DELETE FROM order_items WHERE order_id IN (SELECT id FROM orders WHERE user_id = ?)",
                "DELETE FROM orders WHERE user_id = ?",
                // Delete posts
                "DELETE FROM posts WHERE author_id = ?",
                // Delete contact history
                "DELETE FROM customer_contact_history WHERE user_id = ? OR updated_by = ?",
                // Delete addresses
                "DELETE FROM user_addresses WHERE user_id = ?",
                // Delete token
                "DELETE FROM tokenPassword WHERE UserID = ?",
                // Finally delete user
                "DELETE FROM users WHERE id = ?"
            };

            for (String sql : deleteQueries) {
                try (PreparedStatement st = connection.prepareStatement(sql)) {
                    if (sql.contains("OR updated_by")) {
                        st.setInt(1, userID);
                        st.setInt(2, userID);
                    } else {
                        st.setInt(1, userID);
                    }
                    st.executeUpdate();
                }
            }

            deleteAvatarFile(userID);
            connection.commit();
            return true;

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean updateUserInfo(User user) {
        String sql = "UPDATE users SET full_name=?, email=?, mobile=?, gender=?, role=?, status=?, updated_at=GETDATE() WHERE id=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, user.getFullName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getMobile());
            st.setString(4, user.getGender());
            st.setString(5, user.getRole());
            st.setString(6, user.getStatus());
            st.setInt(7, user.getId());

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createUser(User user) {
        String sql = "INSERT INTO users (full_name, username, password_hash, email, mobile, gender, role, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPasswordHash());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getMobile());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getRole());
            ps.setString(8, user.getStatus());

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> GetAllUsers() {
        List<User> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM users";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getAuthorsByRole() {
        List<User> authors = new ArrayList<>();
        String query = "SELECT id, full_name, role FROM users WHERE role IN ('admin', 'marketing')";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("full_name"));
                user.setRole(rs.getString("role"));
                authors.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authors;
    }

////////
    public static void main(String[] args) {
        UserDAO UserDAO = new UserDAO();
        System.out.println(UserDAO.checkExistUsername("1234"));
    }
}
