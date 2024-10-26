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
import model.Brand;
import model.Category;
import model.Product;
import model.SubImage;

public class ProductDAO extends DBContext {

    //Tính tổng số trang
    public int getTotalProducts() {
        String countQuery = "SELECT COUNT(*) FROM products where 1=1";
        try {
            PreparedStatement countStmt = connection.prepareStatement(countQuery);
            ResultSet countRs = countStmt.executeQuery();
            int totalProducts = 0;
            if (countRs.next()) {
                totalProducts = countRs.getInt(1);
            }
            return totalProducts;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getTotalProducts(String collumn) {
        String countQuery = "SELECT COUNT(*) FROM products where 1=1" + collumn;
        try {
            PreparedStatement countStmt = connection.prepareStatement(countQuery);
            ResultSet countRs = countStmt.executeQuery();
            int totalProducts = 0;
            if (countRs.next()) {
                totalProducts = countRs.getInt(1);
            }
            return totalProducts;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getTotalProductsBySearchAndFilter(String keyword, String priceRange) {
        String query = "SELECT COUNT(*) FROM products WHERE name LIKE ?";
        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "under1000":
                    query += " AND price < 1000";
                    break;
                case "1000to2000":
                    query += " AND price BETWEEN 1000 AND 2000";
                    break;
                case "2000to2500":
                    query += " AND price BETWEEN 2000 AND 2500";
                    break;
                case "above2500":
                    query += " AND price > 2500";
                    break;
            }
        }
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy sản phẩm tương tự
    public List<Product> getSameProducts(int category_id, int pageSize, int offset) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products WHERE category_id = ? ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            // get product
            statement.setInt(1, category_id);
            statement.setInt(2, offset);
            statement.setInt(3, pageSize);

            ResultSet resultSet1 = statement.executeQuery();
            while (resultSet1.next()) {
                Product product = new Product();
                product.setId(resultSet1.getInt("product_id"));
                product.setName(resultSet1.getString("name"));
                product.setDescription(resultSet1.getString("description"));
                product.setPrice(resultSet1.getBigDecimal("price"));
                product.setStock(resultSet1.getInt("stock"));
                product.setBrandId(resultSet1.getInt("brand_id"));
                product.setCategoryId(resultSet1.getInt("category_id"));
                product.setImageUrl(resultSet1.getString("image_url"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //update SubImage
    public void updateSubImages(int productId, List<String> subImageUrls) {
        // Xóa tất cả ảnh phụ cũ
        String deleteQuery = "DELETE FROM sub_images WHERE product_id = ?";
        try (PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery)) {
            deleteStmt.setInt(1, productId);
            deleteStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Thêm ảnh phụ mới
        String insertQuery = "INSERT INTO sub_images (product_id, sub_image_url) VALUES (?, ?)";
        try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
            for (String url : subImageUrls) {
                insertStmt.setInt(1, productId);
                insertStmt.setString(2, url);
                insertStmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách sub_image
    public List<String> getSubImagesByProductId(int productId) {
        List<String> subImages = new ArrayList<>();
        String sql = "SELECT sub_image_url FROM sub_images WHERE product_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                subImages.add(rs.getString("sub_image_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subImages;
    }

    // Thêm sản phẩm mới vào cơ sở dữ liệu
    public void addProduct(Product product, List<String> subImages) {
        // **ADD ban đầu khi chưa có phần subimage, parametter chỉ có phần Product product**
        //        String query = "INSERT INTO products (name, description, price, stock, brand, category_id, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
        //
        //        try (PreparedStatement statement = connection.prepareStatement(query)) {
        //
        //            statement.setString(1, product.getName());
        //            statement.setString(2, product.getDescription());
        //            statement.setBigDecimal(3, product.getPrice());
        //            statement.setInt(4, product.getStock());
        //            statement.setString(5, product.getBrand());
        //            statement.setInt(6, product.getCategoryId());
        //            statement.setString(7, product.getImageUrl());
        //
        //            statement.executeUpdate();
        //        } catch (SQLException e) {
        //            e.printStackTrace();
        //        }
        //________________________________________________________________________________________________________________________________________________

        String productQuery = "INSERT INTO products (name, description, price, stock, brand_id, category_id, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String subImageQuery = "INSERT INTO sub_images (product_id, sub_image_url) VALUES (?, ?)";

        try (PreparedStatement productStatement = connection.prepareStatement(productQuery, Statement.RETURN_GENERATED_KEYS)) {

            // Thêm sản phẩm vào bảng products
            productStatement.setString(1, product.getName());
            productStatement.setString(2, product.getDescription());
            productStatement.setBigDecimal(3, product.getPrice());
            productStatement.setInt(4, product.getStock());
            productStatement.setInt(5, product.getBrandId());
            productStatement.setInt(6, product.getCategoryId());
            productStatement.setString(7, product.getImageUrl());

            int affectedRows = productStatement.executeUpdate();

            // Kiểm tra xem sản phẩm có được thêm thành công hay không
            if (affectedRows == 0) {
                throw new SQLException("Failed to add product, no rows affected.");
            }

            // Lấy ID của sản phẩm vừa được thêm
            try (ResultSet generatedKeys = productStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int productId = generatedKeys.getInt(1);

                    // Thêm sub-images nếu có
                    if (subImages != null && !subImages.isEmpty()) {
                        try (PreparedStatement subImageStatement = connection.prepareStatement(subImageQuery)) {
                            for (String subImageUrl : subImages) {
                                subImageStatement.setInt(1, productId);
                                subImageStatement.setString(2, subImageUrl);
                                subImageStatement.addBatch(); // Thêm vào batch để xử lý nhiều sub-image cùng lúc
                            }
                            subImageStatement.executeBatch(); // Thực thi batch
                        }
                    }
                } else {
                    throw new SQLException("Failed to add product, no product ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //___________________________________________________________________________________________________________________
    // Lấy tất cả các sản phẩm từ cơ sở dữ liệu
    public List<Product> getAllProducts(int pageSize, int offset) {
        List<Product> products = new ArrayList<>();
//        String query1 = "SELECT * FROM products";

        String query2 = "SELECT * FROM brands";
        String query3 = "SELECT * FROM categories";
        String query4 = "SELECT * FROM sub_images";
        try {
            Statement statement = connection.createStatement();
            //get listBrands
            List<Brand> tempBrands = new ArrayList<>();
            ResultSet rsBrand = statement.executeQuery(query2);
            while (rsBrand.next()) {
                Brand brand = new Brand();
                brand.setBrandId(rsBrand.getInt("brand_id"));
                brand.setBrandName(rsBrand.getString("brand_name"));
                tempBrands.add(brand);
            }

            //get listCategoris
            List<Category> tempCate = new ArrayList<>();
            ResultSet rsCate = statement.executeQuery(query3);
            while (rsCate.next()) {
                Category cate = new Category();
                cate.setCategoryId(rsCate.getInt("category_id"));
                cate.setCategoryName(rsCate.getString("category_name"));
                tempCate.add(cate);
            }

            //get listSubImages
            List<SubImage> tempListSubIm = new ArrayList<>();
            ResultSet rsListSubIm = statement.executeQuery(query4);
            while (rsListSubIm.next()) {
                SubImage subImage = new SubImage();

                subImage.setSubImageId(rsListSubIm.getInt("sub_image_id"));
                subImage.setProductId(rsListSubIm.getInt("product_id"));
                subImage.setSubImagePath(rsListSubIm.getString("sub_image_url"));
            }
            // get product
//            ResultSet resultSet1 = statement.executeQuery(query1);
            String query1 = "SELECT * FROM products ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement stmt = connection.prepareStatement(query1);
            stmt.setInt(2, pageSize); // Số sản phẩm trên mỗi trang
            stmt.setInt(1, offset); // Vị trí bắt đầu
            ResultSet resultSet1 = stmt.executeQuery();
            while (resultSet1.next()) {
                Product product = new Product();
                product.setId(resultSet1.getInt("product_id"));
                product.setName(resultSet1.getString("name"));
                product.setDescription(resultSet1.getString("description"));
                product.setPrice(resultSet1.getBigDecimal("price"));
                product.setStock(resultSet1.getInt("stock"));
                product.setBrandId(resultSet1.getInt("brand_id"));
                product.setCategoryId(resultSet1.getInt("category_id"));
                product.setImageUrl(resultSet1.getString("image_url"));
                product.setListBrand(tempBrands);
                product.setListCategory(tempCate);
                product.setListSubImages(tempListSubIm);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    //________________________________________________________________________________
    // Lấy thông tin sản phẩm từ ID
    public Product getProductByID(int id) {
        String query1 = "SELECT * FROM products where product_id=?";
        String query2 = "SELECT * FROM brands";
        String query3 = "SELECT * FROM categories";
        String query4 = "SELECT * FROM sub_images";
        try {
            Statement statement = connection.createStatement();

            //get listBrands
            List<Brand> tempBrands = new ArrayList<>();
            ResultSet rsBrand = statement.executeQuery(query2);
            while (rsBrand.next()) {
                Brand brand = new Brand();
                brand.setBrandId(rsBrand.getInt("brand_id"));
                brand.setBrandName(rsBrand.getString("brand_name"));
                tempBrands.add(brand);
            }
            //get listCategoris
            List<Category> tempCate = new ArrayList<>();
            ResultSet rsCate = statement.executeQuery(query3);
            while (rsCate.next()) {
                Category cate = new Category();
                cate.setCategoryId(rsCate.getInt("category_id"));
                cate.setCategoryName(rsCate.getString("category_name"));
                tempCate.add(cate);
            }
            //get listSubImages
            List<SubImage> tempListSubIm = new ArrayList<>();
            ResultSet rsListSubIm = statement.executeQuery(query4);
            while (rsListSubIm.next()) {
                SubImage subImage = new SubImage();
                subImage.setSubImageId(rsListSubIm.getInt("sub_image_id"));
                subImage.setProductId(rsListSubIm.getInt("product_id"));
                subImage.setSubImagePath(rsListSubIm.getString("sub_image_url"));
                tempListSubIm.add(subImage);
            }
            PreparedStatement statementQ = connection.prepareStatement(query1);
            statementQ.setInt(1, id);
            ResultSet resultSet = statementQ.executeQuery();
            Product product = new Product();
            if (resultSet.next()) {
                product.setId(resultSet.getInt("product_id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getBigDecimal("price"));
                product.setStock(resultSet.getInt("stock"));
                product.setBrandId(resultSet.getInt("brand_id"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setImageUrl(resultSet.getString("image_url"));
                product.setListBrand(tempBrands);
                product.setListCategory(tempCate);
                product.setListSubImages(tempListSubIm);
            }
            return product;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //___________________________________________________________________________________________________________________
    // Cập nhật thông tin sản phẩm
    public void updateProduct(Product product) {
        String query = "UPDATE products SET name = ?, description = ?, price = ?, stock = ?, brand_id = ?, category_id = ?, image_url = ? WHERE product_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setBigDecimal(3, product.getPrice());
            statement.setInt(4, product.getStock());
            statement.setInt(5, product.getBrandId());
            statement.setInt(6, product.getCategoryId());
            statement.setString(7, product.getImageUrl());
            statement.setInt(8, product.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //___________________________________________________________________________________________________________________
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

    //____________________________________________________________________________
    //Lấy Products Chung Brand
    public List<Product> getProductsByBrand(int brandId, int pageSize, int offset) {
        List<Product> products = new ArrayList<>();
        String query1 = "SELECT * FROM products WHERE brand_id = ? ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String query2 = "SELECT * FROM brands";
        String query3 = "SELECT * FROM categories";
        try {
            Statement statement = connection.createStatement();

            //get listBrands
            List<Brand> tempBrands = new ArrayList<>();
            ResultSet rsBrand = statement.executeQuery(query2);
            while (rsBrand.next()) {
                Brand brand = new Brand();
                brand.setBrandId(rsBrand.getInt("brand_id"));
                brand.setBrandName(rsBrand.getString("brand_name"));
                tempBrands.add(brand);
            }

            //get listCategoris
            List<Category> tempCate = new ArrayList<>();
            ResultSet rsCate = statement.executeQuery(query3);
            while (rsCate.next()) {
                Category cate = new Category();
                cate.setCategoryId(rsCate.getInt("category_id"));
                cate.setCategoryName(rsCate.getString("category_name"));
                tempCate.add(cate);
            }
            // get product
            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(1, brandId);
            statement1.setInt(2, offset);
            statement1.setInt(3, pageSize);
            ResultSet resultSet1 = statement1.executeQuery();
            while (resultSet1.next()) {
                Product product = new Product();
                product.setId(resultSet1.getInt("product_id"));
                product.setName(resultSet1.getString("name"));
                product.setDescription(resultSet1.getString("description"));
                product.setPrice(resultSet1.getBigDecimal("price"));
                product.setStock(resultSet1.getInt("stock"));
                product.setBrandId(resultSet1.getInt("brand_id"));
                product.setCategoryId(resultSet1.getInt("category_id"));
                product.setImageUrl(resultSet1.getString("image_url"));
                product.setListBrand(tempBrands);
                product.setListCategory(tempCate);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //_____________________________________________________________________________________
    //Lấy Products Chung Danh Mục
    public List<Product> getProductsByCate(int categoryId, int pageSize, int offset) {
        List<Product> products = new ArrayList<>();
//        String query1 = "select * from products\n"
//                + "where  ? = category_id";
        String query1 = "SELECT * FROM products WHERE category_id = ? ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String query2 = "SELECT * FROM brands";
        String query3 = "SELECT * FROM categories";
        try {
            Statement statement = connection.createStatement();

            //get listBrands
            List<Brand> tempBrands = new ArrayList<>();
            ResultSet rsBrand = statement.executeQuery(query2);
            while (rsBrand.next()) {
                Brand brand = new Brand();
                brand.setBrandId(rsBrand.getInt("brand_id"));
                brand.setBrandName(rsBrand.getString("brand_name"));
                tempBrands.add(brand);
            }
            //get listCategoris
            List<Category> tempCate = new ArrayList<>();
            ResultSet rsCate = statement.executeQuery(query3);
            while (rsCate.next()) {
                Category cate = new Category();
                cate.setCategoryId(rsCate.getInt("category_id"));
                cate.setCategoryName(rsCate.getString("category_name"));
                tempCate.add(cate);
            }
            //get product
            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(1, categoryId);
            statement1.setInt(2, offset);
            statement1.setInt(3, pageSize);

            ResultSet resultSet1 = statement1.executeQuery();
            while (resultSet1.next()) {
                Product product = new Product();
                product.setId(resultSet1.getInt("product_id"));
                product.setName(resultSet1.getString("name"));
                product.setDescription(resultSet1.getString("description"));
                product.setPrice(resultSet1.getBigDecimal("price"));
                product.setStock(resultSet1.getInt("stock"));
                product.setBrandId(resultSet1.getInt("brand_id"));
                product.setCategoryId(resultSet1.getInt("category_id"));
                product.setImageUrl(resultSet1.getString("image_url"));
                product.setListBrand(tempBrands);
                product.setListCategory(tempCate);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //_______________________________________________________________________________
    //Lấy Products từ Search rồi Filter
    public List<Product> getProductsBySearch(String keyword, String priceRange, String sortOrder, int pageSize, int offset) {
        List<Product> products = new ArrayList<>();
//        String query = "SELECT * FROM products WHERE name LIKE ? ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String query = "SELECT * FROM products WHERE name LIKE ?";

        // Thêm điều kiện khoảng giá vào query
        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "under1000":
                    query += " AND price < 1000";
                    break;
                case "1000to2000":
                    query += " AND price BETWEEN 1000 AND 2000";
                    break;
                case "2000to2500":
                    query += " AND price BETWEEN 2000 AND 2500";
                    break;
                case "above2500":
                    query += " AND price > 2500";
                    break;
                default:
                    break;
            }
        }
        // Thêm điều kiện sắp xếp
        if (sortOrder != null && !sortOrder.isEmpty()) {
            query += " ORDER BY price " + (sortOrder.equals("asc") ? "ASC" : "DESC");
        } else {
            query += " ORDER BY product_id ";
        }
        query += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String query2 = "SELECT * FROM brands";
        String query3 = "SELECT * FROM categories";
        try {
            Statement statement = connection.createStatement();

            //get listBrands
            List<Brand> tempBrands = new ArrayList<>();
            ResultSet rsBrand = statement.executeQuery(query2);
            while (rsBrand.next()) {
                Brand brand = new Brand();
                brand.setBrandId(rsBrand.getInt("brand_id"));
                brand.setBrandName(rsBrand.getString("brand_name"));
                tempBrands.add(brand);
            }
            //get listCategoris
            List<Category> tempCate = new ArrayList<>();
            ResultSet rsCate = statement.executeQuery(query3);
            while (rsCate.next()) {
                Category cate = new Category();
                cate.setCategoryId(rsCate.getInt("category_id"));
                cate.setCategoryName(rsCate.getString("category_name"));
                tempCate.add(cate);
            }

            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, "%" + keyword + "%");
            stmt.setInt(2, offset);
            stmt.setInt(3, pageSize);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setStock(rs.getInt("stock"));
                product.setBrandId(rs.getInt("brand_id"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setListBrand(tempBrands);
                product.setListCategory(tempCate);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //____________________________________________________________________________________________
    //Lấy Products rồi Filter
    public List<Product> getProductsAndFilter(String priceRange, String sortOrder, int pageSize, int offset) {
        List<Product> products = new ArrayList<>();
//        String query = "SELECT * FROM products WHERE name LIKE ? ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String query = "SELECT * FROM products ";

        // Thêm điều kiện khoảng giá vào query
        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "under1000":
                    query += " AND price < 1000";
                    break;
                case "1000to2000":
                    query += " AND price BETWEEN 1000 AND 2000";
                    break;
                case "2000to2500":
                    query += " AND price BETWEEN 2000 AND 2500";
                    break;
                case "above2500":
                    query += " AND price > 2500";
                    break;
            }
        }
        // Thêm điều kiện sắp xếp
        if (sortOrder != null && !sortOrder.isEmpty()) {
            query += " ORDER BY price " + (sortOrder.equals("asc") ? "ASC" : "DESC");
        } else {
            query += " ORDER BY product_id ";
        }

        query += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String query2 = "SELECT * FROM brands";
        String query3 = "SELECT * FROM categories";
        try {
            Statement statement = connection.createStatement();

            //get listBrands
            List<Brand> tempBrands = new ArrayList<>();
            ResultSet rsBrand = statement.executeQuery(query2);
            while (rsBrand.next()) {
                Brand brand = new Brand();
                brand.setBrandId(rsBrand.getInt("brand_id"));
                brand.setBrandName(rsBrand.getString("brand_name"));
                tempBrands.add(brand);
            }
            //get listCategoris
            List<Category> tempCate = new ArrayList<>();
            ResultSet rsCate = statement.executeQuery(query3);
            while (rsCate.next()) {
                Category cate = new Category();
                cate.setCategoryId(rsCate.getInt("category_id"));
                cate.setCategoryName(rsCate.getString("category_name"));
                tempCate.add(cate);
            }

            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, offset);
            stmt.setInt(2, pageSize);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setStock(rs.getInt("stock"));
                product.setBrandId(rs.getInt("brand_id"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setListBrand(tempBrands);
                product.setListCategory(tempCate);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    //____________________________________________________________________________________________
}
