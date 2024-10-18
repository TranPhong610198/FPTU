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
import model.Brand;

/**
 *
 * @author tphon
 */
public class BrandDAO extends DBContext {
    // Phương thức lấy tất cả người dùng

    public List<Brand> getAll() {
        List<Brand> brands = new ArrayList<>();
        String sql = "SELECT * FROM brands";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                brands.add(new Brand(
                        resultSet.getInt("brand_id"),
                        resultSet.getString("brand_name")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return brands;
    }

    public void addBrand(String name) {
        String sql = "INSERT INTO brands (brand_name) VALUES (?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void updateBrand(Brand brand){
        String sql = "UPDATE brands SET brand_name = ? WHERE brand_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, brand.getBrandName());
            statement.setInt(2, brand.getBrandId());
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public void deleteBrand(int brandId) {
        String sql = "DELETE FROM brands WHERE brand_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, brandId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    public static void main(String[] args) {
//        BrandDAO bd = new BrandDAO();
//        List<Brand> temp = bd.getAll();
//        
//        for (Brand li : temp){
//            System.out.println(li.getBrandName());
//        }
//    }
}
