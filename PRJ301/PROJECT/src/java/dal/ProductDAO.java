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
import model.Product;

public class ProductDAO extends DBContext {

    // Thêm sản phẩm mới vào cơ sở dữ liệu
    public void addProduct(Product product) {
        String query = "INSERT INTO products (name, description, price, stock, brand, category_id, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setBigDecimal(3, product.getPrice());
            statement.setInt(4, product.getStock());
            statement.setString(5, product.getBrand());
            statement.setInt(6, product.getCategoryId());
            statement.setString(7, product.getImageUrl());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả các sản phẩm từ cơ sở dữ liệu
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("product_id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getBigDecimal("price"));
                product.setStock(resultSet.getInt("stock"));
                product.setBrand(resultSet.getString("brand"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setImageUrl(resultSet.getString("image_url"));

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    // Lấy thông tin sản phẩm từ ID
    public Product getProductByID(int id) {
        String query = "SELECT * FROM products where product_id=?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            Product product = new Product();
            if (resultSet.next()) {

                product.setId(resultSet.getInt("product_id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getBigDecimal("price"));
                product.setStock(resultSet.getInt("stock"));
                product.setBrand(resultSet.getString("brand"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setImageUrl(resultSet.getString("image_url"));

            }
            return product;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Cập nhật thông tin sản phẩm
    public void updateProduct(Product product) {
        String query = "UPDATE products SET name = ?, description = ?, price = ?, stock = ?, brand = ?, category_id = ?, image_url = ? WHERE product_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setBigDecimal(3, product.getPrice());
            statement.setInt(4, product.getStock());
            statement.setString(5, product.getBrand());
            statement.setInt(6, product.getCategoryId());
            statement.setString(7, product.getImageUrl());
            statement.setInt(8, product.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa sản phẩm khỏi cơ sở dữ liệu
    public void deleteProduct(int productId) {
        String query = "DELETE FROM products WHERE product_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
