package DAO;

import Context.DBContext;
import entity.Footer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FooterDAO extends DBContext {

    public List<Footer> getAllFooters(String searchValue, String statusFilter, String sortColumn, String sortOrder) {
        List<Footer> list = new ArrayList<>();
        String sql = "SELECT * FROM footer_settings WHERE 1=1";

        if (searchValue != null && !searchValue.trim().isEmpty()) {
            sql += " AND value LIKE ?";
        }

        if (statusFilter != null && !statusFilter.trim().isEmpty()) {
            sql += " AND status = ?";
        }

        if (sortColumn != null && !sortColumn.trim().isEmpty()) {
            sql += " ORDER BY " + sortColumn + " " + sortOrder;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;

            if (searchValue != null && !searchValue.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + searchValue + "%");
            }

            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                ps.setString(paramIndex, statusFilter);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Footer(
                        rs.getInt("id"),
                        rs.getString("type"),
                        rs.getString("field_name"),
                        rs.getString("value"),
                        rs.getString("status"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Thêm phương thức mới để hỗ trợ phân trang
    public List<Footer> getPaginatedFooters(String searchValue, String statusFilter, String sortColumn, String sortOrder, int page, int pageSize) {
        List<Footer> list = new ArrayList<>();

        // SQL Server sử dụng OFFSET-FETCH để phân trang
        StringBuilder sql = new StringBuilder("SELECT * FROM footer_settings WHERE 1=1");

        if (searchValue != null && !searchValue.trim().isEmpty()) {
            sql.append(" AND (value LIKE ? OR field_name LIKE ?)");
        }

        if (statusFilter != null && !statusFilter.trim().isEmpty()) {
            sql.append(" AND status = ?");
        }

        // Phải có ORDER BY trước khi sử dụng OFFSET-FETCH
        if (sortColumn != null && !sortColumn.trim().isEmpty()) {
            sql.append(" ORDER BY ").append(sortColumn).append(" ").append(sortOrder);
        } else {
            sql.append(" ORDER BY id ASC");
        }

        // Thêm OFFSET-FETCH cho phân trang trong SQL Server
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());
            int paramIndex = 1;

            if (searchValue != null && !searchValue.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + searchValue + "%");
                ps.setString(paramIndex++, "%" + searchValue + "%");
            }

            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                ps.setString(paramIndex++, statusFilter);
            }

            // Offset và Fetch trong SQL Server
            ps.setInt(paramIndex++, (page - 1) * pageSize); // OFFSET
            ps.setInt(paramIndex, pageSize); // FETCH NEXT

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Footer(
                        rs.getInt("id"),
                        rs.getString("type"),
                        rs.getString("field_name"),
                        rs.getString("value"),
                        rs.getString("status"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Phương thức để đếm tổng số bản ghi để tính toán phân trang
    public int countTotalFooters(String searchValue, String statusFilter) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS total FROM footer_settings WHERE 1=1";

        if (searchValue != null && !searchValue.trim().isEmpty()) {
            sql += " AND (value LIKE ? OR field_name LIKE ?)";
        }

        if (statusFilter != null && !statusFilter.trim().isEmpty()) {
            sql += " AND status = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;

            if (searchValue != null && !searchValue.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + searchValue + "%");
                ps.setString(paramIndex++, "%" + searchValue + "%");
            }

            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                ps.setString(paramIndex, statusFilter);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE footer_settings SET status = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /*-----------------------------------------------------------------------------*/

 /*-----------------------------Hiển thị bên user--------------------------------*/
    public List<Footer> getFootersByType(String type) {
        List<Footer> list = new ArrayList<>();
        String sql = "SELECT * FROM footer_settings WHERE type = ? AND status = 'active'";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, type);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Footer(
                        rs.getInt("id"),
                        rs.getString("type"),
                        rs.getString("field_name"),
                        rs.getString("value"),
                        rs.getString("status"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Footer> getCompanyInfo() {
        return getFootersByType("info");
    }

    public List<Footer> getContactInfo() {
        return getFootersByType("contact");
    }

    public List<Footer> getSocialLinks() {
        return getFootersByType("social");
    }

    /*-----------------------------------------------------------------------------*/

 /*-----------------------------------CRUD-------------------------------------*/
    public Footer getFooterById(int id) {
        String sql = "SELECT * FROM footer_settings WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Footer(
                        rs.getInt("id"),
                        rs.getString("type"),
                        rs.getString("field_name"),
                        rs.getString("value"),
                        rs.getString("status"),
                        rs.getString("image")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateFooter(Footer footer) {
        String sql = "UPDATE footer_settings SET field_name = ?, value = ?, type = ?, status = ?, image = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, footer.getFieldName());
            ps.setString(2, footer.getValue());
            ps.setString(3, footer.getType());
            ps.setString(4, footer.getStatus());
            ps.setString(5, footer.getImage());
            ps.setInt(6, footer.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertFooter(Footer footer) {
        String sql = "INSERT INTO footer_settings (field_name, value, type, status, image) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, footer.getFieldName());
            ps.setString(2, footer.getValue());
            ps.setString(3, footer.getType());
            ps.setString(4, footer.getStatus());
            ps.setString(5, footer.getImage());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteFooter(int id) {
        String sql = "DELETE FROM footer_settings WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
