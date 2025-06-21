package DAO;

import Context.DBContext;
import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT c1.*, c2.name as parent_name "
                + "FROM categories c1 "
                + "LEFT JOIN categories c2 ON c1.parent_id = c2.id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setParentId(rs.getObject("parent_id") != null ? rs.getInt("parent_id") : null);
                category.setLevel(rs.getInt("level"));
                category.setStatus(rs.getString("status"));
                category.setParentName(rs.getString("parent_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    public List<Category> getThirdLevelCategories() {
        List<Category> thirdLevelCats = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE level = 3";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));
                cat.setDescription(rs.getString("description"));
                cat.setParentId(rs.getInt("parent_id"));
                cat.setStatus(rs.getString("status"));
                thirdLevelCats.add(cat);
            }
        } catch (SQLException e) {
            System.out.println("Error getting third level categories: " + e.getMessage());
            e.printStackTrace();
        }

        return thirdLevelCats;
    }

    public List<Integer> getChildCategoryIds(int parentId) {
        List<Integer> categoryIds = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(
                "WITH RecursiveCategories AS ( "
                + "   SELECT id FROM categories WHERE parent_id = ? "
                + "   UNION ALL "
                + "   SELECT c.id FROM categories c "
                + "   INNER JOIN RecursiveCategories rc ON c.parent_id = rc.id) "
                + "SELECT id FROM RecursiveCategories"
        )) {
            ps.setInt(1, parentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                categoryIds.add(rs.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryIds;
    }

    // Thêm phương thức lấy danh sách có phân trang
    public List<Category> getCategories(int page, int pageSize) {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT c1.*, c2.name as parent_name "
                + "FROM categories c1 "
                + "LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + "ORDER BY c1.id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (page - 1) * pageSize);
            statement.setInt(2, pageSize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setParentId(rs.getObject("parent_id") != null ? rs.getInt("parent_id") : null);
                category.setLevel(rs.getInt("level"));
                category.setStatus(rs.getString("status"));
                category.setParentName(rs.getString("parent_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error in getCategories: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    // Thêm phương thức đếm tổng số danh mục
    public int getTotalCategories() {
        String sql = "SELECT COUNT(*) FROM categories";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error in getTotalCategories: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    public boolean deleteCategory(int id) {
        String checkSql = "SELECT COUNT(*) FROM categories WHERE parent_id = ?";
        String deleteSql = "DELETE FROM categories WHERE id = ?";
        try {
            PreparedStatement checkStmt = connection.prepareStatement(checkSql);
            checkStmt.setInt(1, id);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return false;
            }
            PreparedStatement deleteStmt = connection.prepareStatement(deleteSql);
            deleteStmt.setInt(1, id);
            int rowsAffected = deleteStmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting category: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean addCategory(Category category) {
        String sql = "INSERT INTO categories (name, description, parent_id, level, status) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            if (category.getParentId() != null) {
                stmt.setInt(3, category.getParentId());
            } else {
                stmt.setNull(3, java.sql.Types.INTEGER);
            }
            stmt.setInt(4, category.getLevel());
            stmt.setString(5, category.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error adding category: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public List<Category> getPotentialParents() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT c1.*, c2.name as parent_name "
                + "FROM categories c1 "
                + "LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + "WHERE c1.level < 3 "
                + // Chỉ lấy level 1 và 2
                "ORDER BY c1.level, c1.name";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setLevel(rs.getInt("level"));
                category.setParentName(rs.getString("parent_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error getting potential parents: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    // Lấy thông tin category theo ID
    public Category getCategoryById(int id) {
        String sql = "SELECT c1.*, c2.name as parent_name "
                + "FROM categories c1 "
                + "LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + "WHERE c1.id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setParentId(rs.getObject("parent_id") != null ? rs.getInt("parent_id") : null);
                category.setLevel(rs.getInt("level"));
                category.setStatus(rs.getString("status"));
                category.setParentName(rs.getString("parent_name"));
                return category;
            }
        } catch (SQLException e) {
            System.out.println("Error getting category by id: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public List<Category> getChildCategories(int parentId) {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT c1.*, c2.name as parent_name "
                + "FROM categories c1 "
                + "LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + "WHERE c1.parent_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, parentId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setParentId(rs.getObject("parent_id") != null ? rs.getInt("parent_id") : null);
                category.setLevel(rs.getInt("level"));
                category.setStatus(rs.getString("status"));
                category.setParentName(rs.getString("parent_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error getting child categories: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    public boolean updateCategory(Category category) {
        String sql = "UPDATE categories SET name = ?, description = ?, parent_id = ?, level = ?, status = ? WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getName());
            st.setString(2, category.getDescription());

            if (category.getParentId() != null) {
                st.setInt(3, category.getParentId());
            } else {
                st.setNull(3, java.sql.Types.INTEGER);
            }

            st.setInt(4, category.getLevel());
            st.setString(5, category.getStatus());
            st.setInt(6, category.getId());

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error updating category: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
