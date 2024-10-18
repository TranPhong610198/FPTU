/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author tphon
 */
public class CategoryDAO extends DBContext {
        public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                categories.add(new Category(
                        resultSet.getInt("category_id"),
                        resultSet.getString("category_name")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }

    public void addCategory(String name) {
        String sql = "INSERT INTO categories (category_name) VALUES (?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void updateCategory(Category category){
        String sql = "UPDATE categories SET category_name = ? WHERE category_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category.getCategoryName());
            statement.setInt(2, category.getCategoryId());
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public void deleteCategory(int categoryId) {
        String sql = "DELETE FROM categories WHERE category_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
