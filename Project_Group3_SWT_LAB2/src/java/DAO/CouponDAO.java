/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author nguye
 */
import Context.DBContext;
import entity.Coupon;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO extends DBContext {

    public List<Coupon> getCoupons(String searchCode, String filterType, String filterStatus, String sortField, String sortOrder, int page, int recordsPerPage) {
        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT * FROM coupons WHERE 1=1";

        // Thêm điều kiện tìm kiếm và lọc
        if (searchCode != null && !searchCode.isEmpty()) {
            sql += " AND code LIKE ?";
        }
        if (filterType != null && !filterType.isEmpty()) {
            sql += " AND discount_type = ?";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql += " AND status = ?";
        }

        // Thêm sắp xếp
        if (sortField != null && !sortField.isEmpty()) {
            sql += " ORDER BY " + sortField + (sortOrder.equals("desc") ? " DESC" : " ASC");
        } else {
            sql += " ORDER BY created_at desc"; // Sắp xếp mặc định
        }

        // Thêm phân trang
        sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            int parameterIndex = 1;
            if (searchCode != null && !searchCode.isEmpty()) {
                ps.setString(parameterIndex++, "%" + searchCode + "%");
            }
            if (filterType != null && !filterType.isEmpty()) {
                ps.setString(parameterIndex++, filterType);
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(parameterIndex++, filterStatus);
            }

            ps.setInt(parameterIndex++, (page - 1) * recordsPerPage);
            ps.setInt(parameterIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Coupon coupon = new Coupon();
                coupon.setId(rs.getInt("id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscount_type(rs.getString("discount_type"));
                coupon.setDiscount_value(rs.getDouble("discount_value"));
                coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
                coupon.setMax_discount(rs.getDouble("max_discount"));
                coupon.setUsage_limit(rs.getInt("usage_limit"));
                coupon.setUsed_count(rs.getInt("used_count"));
                coupon.setExpiry_date(rs.getDate("expiry_date"));
                coupon.setCreated_at(rs.getDate("created_at"));
                coupon.setStatus(rs.getString("status"));
                list.add(coupon);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalCoupons(String searchCode, String filterType, String filterStatus) {
        String sql = "SELECT COUNT(*) FROM coupons WHERE 1=1";

        // Thêm điều kiện tìm kiếm và lọc
        if (searchCode != null && !searchCode.isEmpty()) {
            sql += " AND code LIKE ?";
        }
        if (filterType != null && !filterType.isEmpty()) {
            sql += " AND discount_type = ?";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql += " AND status = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            int parameterIndex = 1;
            if (searchCode != null && !searchCode.isEmpty()) {
                ps.setString(parameterIndex++, "%" + searchCode + "%");
            }
            if (filterType != null && !filterType.isEmpty()) {
                ps.setString(parameterIndex++, filterType);
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(parameterIndex++, filterStatus);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public boolean addCoupon(Coupon coupon) {
        String sql = "INSERT INTO coupons (code, discount_type, discount_value, min_order_amount, max_discount, usage_limit, used_count, expiry_date, created_at, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, coupon.getCode());
            ps.setString(2, coupon.getDiscount_type());
            ps.setDouble(3, coupon.getDiscount_value());
            ps.setDouble(4, coupon.getMin_order_amount());
            ps.setDouble(5, coupon.getMax_discount());
            ps.setInt(6, coupon.getUsage_limit());
            ps.setInt(7, coupon.getUsed_count());
            ps.setDate(8, coupon.getExpiry_date());
            ps.setDate(9, coupon.getCreated_at());
            ps.setString(10, coupon.getStatus());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isCouponCodeExists(String code) {
        String sql = "SELECT COUNT(*) FROM coupons WHERE code = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCoupon(int id) {
        try {
            String sql = "DELETE FROM Coupons WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);
                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Coupon getCouponById(int id) {
        String sql = "SELECT * FROM coupons WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Coupon coupon = new Coupon();
                coupon.setId(rs.getInt("id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscount_type(rs.getString("discount_type"));
                coupon.setDiscount_value(rs.getDouble("discount_value"));
                coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
                coupon.setMax_discount(rs.getDouble("max_discount"));
                coupon.setUsage_limit(rs.getInt("usage_limit"));
                coupon.setUsed_count(rs.getInt("used_count"));
                coupon.setExpiry_date(rs.getDate("expiry_date"));
                coupon.setCreated_at(rs.getDate("created_at"));
                coupon.setStatus(rs.getString("status"));
                return coupon;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateCoupon(Coupon coupon) {
        String sql = "UPDATE coupons SET code = ?, discount_type = ?, discount_value = ?, min_order_amount = ?, max_discount = ?, usage_limit = ?, expiry_date = ?, status = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, coupon.getCode());
            ps.setString(2, coupon.getDiscount_type());
            ps.setDouble(3, coupon.getDiscount_value());
            ps.setDouble(4, coupon.getMin_order_amount());
            ps.setDouble(5, coupon.getMax_discount());
            ps.setInt(6, coupon.getUsage_limit());
            ps.setDate(7, coupon.getExpiry_date());
            ps.setString(8, coupon.getStatus());
            ps.setInt(9, coupon.getId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Coupon getCouponByCode(String code) {
        String sql = "SELECT * FROM coupons WHERE code = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Coupon coupon = new Coupon();
                coupon.setId(rs.getInt("id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscount_type(rs.getString("discount_type"));
                coupon.setDiscount_value(rs.getDouble("discount_value"));
                coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
                coupon.setMax_discount(rs.getDouble("max_discount"));
                coupon.setUsage_limit(rs.getInt("usage_limit"));
                coupon.setUsed_count(rs.getInt("used_count"));
                coupon.setExpiry_date(rs.getDate("expiry_date"));
                coupon.setCreated_at(rs.getDate("created_at"));
                coupon.setStatus(rs.getString("status"));
                return coupon;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Coupon> getAvailableCoupons() {
        List<Coupon> coupons = new ArrayList<>();
        String sql = "SELECT * FROM coupons "
                + "WHERE status = 'active' "
                + "AND (expiry_date IS NULL OR expiry_date > GETDATE()) "
                + "AND (usage_limit IS NULL OR used_count < usage_limit) "
                + "ORDER BY min_order_amount ASC";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Coupon coupon = new Coupon();
                coupon.setId(rs.getInt("id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscount_type(rs.getString("discount_type"));
                coupon.setDiscount_value(rs.getDouble("discount_value"));
                coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
                coupon.setMax_discount(rs.getDouble("max_discount"));
                coupon.setUsage_limit(rs.getInt("usage_limit"));
                coupon.setUsed_count(rs.getInt("used_count"));
                coupon.setExpiry_date(rs.getDate("expiry_date"));
                coupon.setStatus(rs.getString("status"));
                coupons.add(coupon);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coupons;
    }

    public static void main(String[] args) {
        CouponDAO dao = new CouponDAO();
        List<Coupon> list = dao.getCoupons("", "", "", "", "", 1, 10);
        for (Coupon o : list) {
            System.out.println(o);
        }
    }
}
