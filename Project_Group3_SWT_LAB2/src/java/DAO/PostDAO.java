package DAO;

import Context.DBContext;
import entity.Post;
import entity.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PostDAO extends DBContext {

    public static UserDAO userDao = new UserDAO();

    public List<Post> getAllPosts(int page, int pageSize, String search, Integer authorId, String status) {
        List<Post> posts = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM posts");
        List<Object> params = new ArrayList<>();

        // Điều kiện WHERE
        boolean hasCondition = false;
        if (search != null && !search.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" title LIKE ?");
            params.add("%" + search + "%");
            hasCondition = true;
        }

        if (authorId != null && authorId != 0) { // Nếu chọn "All Authors" thì bỏ qua lọc
            sql.append(hasCondition ? " AND" : " WHERE").append(" author_id = ?");
            params.add(authorId);
            hasCondition = true;
        }

        if (status != null && !status.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" status = ?");
            params.add(status);
        }

        // Danh sách các cột hợp lệ
        sql.append(" ORDER BY created_at DESC");

        // Phân trang (đảm bảo FETCH NEXT > 0)
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize); // OFFSET
        params.add(Math.max(pageSize, 1)); // FETCH NEXT (phải > 0)

        // Thực thi truy vấn
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i) instanceof Integer) {
                    st.setInt(i + 1, (Integer) params.get(i));
                } else {
                    st.setString(i + 1, (String) params.get(i));
                }
            }

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setThumbnail(rs.getString("thumbnail"));
                    post.setSummary(rs.getString("summary"));
                    post.setContent(rs.getString("content"));
                    post.setIsFeatured(rs.getBoolean("is_featured"));
                    post.setStatus(rs.getString("status"));
                    post.setCreatedAt(rs.getDate("created_at"));
                    post.setUpdatedAt(rs.getDate("updated_at"));
                    User user = userDao.getUserById(rs.getInt("author_id"));
                    post.setUser(user);

                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public int getTotalPostsCount(String search, Integer authorId, String status) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM posts WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search + "%");
        }

        if (authorId != null) {
            sql.append(" AND author_id = ?");
            params.add(authorId);
        }
        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
            params.add(status);
        }

        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i) instanceof Integer) {
                    st.setInt(i + 1, (Integer) params.get(i));
                } else {
                    st.setString(i + 1, (String) params.get(i));
                }
            }

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Post getPostById(int postId) {
        String sql = "SELECT * FROM posts WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, postId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setThumbnail(rs.getString("thumbnail"));

                    post.setSummary(rs.getString("summary"));
                    post.setContent(rs.getString("content"));

                    post.setIsFeatured(rs.getBoolean("is_featured"));
                    post.setStatus(rs.getString("status"));
                    post.setCreatedAt(rs.getDate("created_at"));
                    post.setUpdatedAt(rs.getDate("updated_at"));
                    User user = userDao.getUserById(rs.getInt("author_id"));
                    post.setUser(user);
                    return post;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addPost(Post post) {
        String sql = "INSERT INTO posts (title, thumbnail, summary, content, author_id, is_featured, status, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, post.getTitle());
            st.setString(2, post.getThumbnail());
            st.setString(3, post.getSummary());
            st.setString(4, post.getContent());
            st.setInt(5, post.getUser().getId());
            st.setBoolean(6, post.isIsFeatured());
            st.setString(7, post.getStatus());
            st.setDate(8, post.getCreatedAt());
            if (post.getUpdatedAt() != null) {
                st.setDate(9, new java.sql.Date(post.getUpdatedAt().getTime()));
            } else {
                st.setNull(9, java.sql.Types.DATE);
            }

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePost(Post post) {
        String sql = "UPDATE posts SET title = ?, thumbnail = ?,  summary = ?, content = ?, status = ?, is_featured = ?, updated_at = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, post.getTitle());
            st.setString(2, post.getThumbnail());
            st.setString(3, post.getSummary());
            st.setString(4, post.getContent());
            st.setString(5, post.getStatus());
            st.setBoolean(6, post.isIsFeatured());

            if (post.getUpdatedAt() != null) {
                st.setDate(7, new java.sql.Date(post.getUpdatedAt().getTime()));
            } else {
                st.setNull(7, java.sql.Types.DATE);
            }

            st.setInt(8, post.getId());

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error updating post: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deletePost(int postId) {
        String sql = "DELETE FROM posts WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, postId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getAuthorsByRole() {
        List<User> authors = new ArrayList<>();
        String query = "SELECT id, full_name, role FROM users WHERE role IN ('admin', 'marketing')";

        try (PreparedStatement stmt = connection.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
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

    public List<Post> getLatestPublishedPosts(int limit) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE status = 'published' ORDER BY updated_at DESC OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, limit);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setThumbnail(rs.getString("thumbnail"));
                    post.setSummary(rs.getString("summary"));
                    post.setContent(rs.getString("content"));
                    post.setIsFeatured(rs.getBoolean("is_featured"));
                    post.setStatus(rs.getString("status"));
                    post.setCreatedAt(rs.getDate("created_at"));
                    post.setUpdatedAt(rs.getDate("updated_at"));
                    User user = userDao.getUserById(rs.getInt("author_id"));
                    post.setUser(user);

                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    // Get total count of published posts for pagination
    public int getPublishedPostsCount(String search) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM posts WHERE status = 'published'");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search + "%");
        }

        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                st.setString(i + 1, (String) params.get(i));
            }

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get published posts with search and pagination
    public List<Post> getPublishedPosts(int page, int pageSize, String search) {
        List<Post> posts = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM posts WHERE status = 'published'");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search + "%");
        }

        // Sort by update date
        sql.append(" ORDER BY updated_at DESC");

        // Add pagination
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize);
        params.add(pageSize);

        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            for (Object param : params) {
                if (param instanceof Integer) {
                    st.setInt(paramIndex++, (Integer) param);
                } else {
                    st.setString(paramIndex++, (String) param);
                }
            }

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setThumbnail(rs.getString("thumbnail"));
                    post.setSummary(rs.getString("summary"));
                    post.setContent(rs.getString("content"));
                    post.setIsFeatured(rs.getBoolean("is_featured"));
                    post.setStatus(rs.getString("status"));
                    post.setCreatedAt(rs.getDate("created_at"));
                    post.setUpdatedAt(rs.getDate("updated_at"));
                    User user = userDao.getUserById(rs.getInt("author_id"));
                    post.setUser(user);

                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public static void main(String[] args) {
        PostDAO postDAO = new PostDAO();

//        // Test lấy tất cả bài viết
//        System.out.println("Lấy danh sách bài viết:");
//        List<Post> posts = postDAO.getAllPosts(1, 5, "", null, null, null, "", "DESC");
//        for (Post post : posts) {
//            System.out.println(post.getId() + " - " + post.getTitle());
//        }
//
//        // Test lấy số lượng bài viết
//        int totalPosts = postDAO.getTotalPostsCount("", null, null, null);
//        System.out.println("Tổng số bài viết: " + totalPosts);
//
//        // Test lấy bài viết theo ID
//        if (!posts.isEmpty()) {
//            int postId = posts.get(0).getId();
//            Post post = postDAO.getPostById(postId);
//            
//            System.out.println("Chi tiết bài viết ID " + postId + ": " + post.getTitle() + ": "+ post.getUser().getFullName());
//        }
//        Post newPost = new Post();
//        Date createdAt = new Date(System.currentTimeMillis());
//        newPost.setTitle("Bài viết mới 2");
//        newPost.setThumbnail("thumbnail.jpg");
//        newPost.setCategoryId(1); // ID danh mục hợp lệ trong DB
//        newPost.setSummary("Tóm tắt bài viết mới");
//        newPost.setContent("Nội dung chi tiết của bài viết mới");
//         newPost.setCreatedAt(createdAt);
//// ✅ Khởi tạo User trước khi gọi setId
//        User user = new User();
//        user.setId(1); // ID tác giả hợp lệ trong DB
//        newPost.setUser(user); // Gán User vào Post
//
//        newPost.setIsFeatured(false);
//        newPost.setStatus("published");
//
//        boolean isAdded = postDAO.addPost(newPost);
//
//        if (isAdded) {
//            System.out.println("Thêm bài viết thành công!");
//        } else {
//            System.out.println("Thêm bài viết thất bại!");
//        int postId = 1; // Đổi thành ID bài viết bạn muốn test
//
//        // Gọi phương thức getPostById
//        Post post = postDAO.getPostById(postId);
//
//        // Kiểm tra và in kết quả
//        if (post != null) {
//            System.out.println("Bài viết tìm thấy:");
//            System.out.println("ID: " + post.getId());
//            System.out.println("Tiêu đề: " + post.getTitle());
//            System.out.println("Tóm tắt: " + post.getSummary());
//            System.out.println("Nội dung: " + post.getContent());
//            System.out.println("Tác giả: " + post.getUser().getFullName());
//            System.out.println("Trạng thái: " + post.getStatus());
//            System.out.println("Ngày tạo: " + post.getCreatedAt());
//            System.out.println("Ngày cập nhật: " + post.getUpdatedAt());
//        } else {
//            System.out.println("Không tìm thấy bài viết với ID: " + postId);
//        }
//        }
    }

    //VTĐ add get post lên home
    public List<Post> getPostToHome(int page, int pageSize, String search, Integer authorId, String status,
            Boolean isFeatured, String sortBy, String sortDirection) {
        List<Post> posts = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM posts");
        List<Object> params = new ArrayList<>();

        // Điều kiện WHERE
        boolean hasCondition = false;
        if (search != null && !search.isEmpty()) {
            sql.append(" WHERE title LIKE ?");
            params.add("%" + search + "%");
            hasCondition = true;
        }

        if (authorId != null && authorId != 0) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" author_id = ?");
            params.add(authorId);
            hasCondition = true;
        }

        if (status != null && !status.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" status = ?");
            params.add(status);
            hasCondition = true;
        }

        // Thêm điều kiện featured
        if (isFeatured != null) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" is_featured = ?");
            params.add(isFeatured);
        }

        // Sắp xếp
        if (sortBy != null && !sortBy.isEmpty()) {
            sql.append(" ORDER BY ").append(sortBy);
            if ("DESC".equalsIgnoreCase(sortDirection)) {
                sql.append(" DESC");
            } else {
                sql.append(" ASC");
            }
        }

        // Phân trang
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize);
        params.add(Math.max(pageSize, 1));

        // Thực thi truy vấn
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i) instanceof Integer) {
                    st.setInt(i + 1, (Integer) params.get(i));
                } else if (params.get(i) instanceof Boolean) {
                    st.setBoolean(i + 1, (Boolean) params.get(i));
                } else {
                    st.setString(i + 1, (String) params.get(i));
                }
            }

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setThumbnail(rs.getString("thumbnail"));
                    post.setSummary(rs.getString("summary"));
                    post.setContent(rs.getString("content"));
                    post.setIsFeatured(rs.getBoolean("is_featured"));
                    post.setStatus(rs.getString("status"));
                    post.setCreatedAt(rs.getDate("created_at"));
                    post.setUpdatedAt(rs.getDate("updated_at"));
                    User user = userDao.getUserById(rs.getInt("author_id"));
                    post.setUser(user);

                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

}
