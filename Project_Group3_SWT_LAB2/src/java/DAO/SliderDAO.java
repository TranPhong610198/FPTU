package DAO;

import Context.DBContext;
import entity.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SliderDAO extends DBContext {

    public List<Slider> getAllSliders(int page, int pageSize, String search, String status) {
        List<Slider> sliders = new ArrayList<>();
        
        StringBuilder sql = new StringBuilder("SELECT * FROM sliders");
        List<Object> params = new ArrayList<>();
        
        // WHERE conditions
        boolean hasCondition = false;
        if (search != null && !search.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" title LIKE ?");
            params.add("%" + search + "%");
            hasCondition = true;
        }
        
        if (status != null && !status.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" status = ?");
            params.add(status);
            hasCondition = true;
        }
        
        // Order by display_order for proper sequencing
        sql.append(" ORDER BY display_order ASC");
        
        // Pagination
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize); // OFFSET
        params.add(Math.max(pageSize, 1)); // FETCH NEXT (must be > 0)
        
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
                    Slider slider = new Slider();
                    slider.setId(rs.getInt("id"));
                    slider.setTitle(rs.getString("title"));
                    slider.setImage_url(rs.getString("image_url"));
                    slider.setLink(rs.getString("link"));
                    slider.setDisplay_order(rs.getInt("display_order"));
                    slider.setStatus(rs.getString("status"));
                    slider.setNotes(rs.getString("notes"));
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting sliders: " + e.getMessage());
            e.printStackTrace();
        }
        return sliders;
    }

    public int getTotalSlidersCount(String search, String status) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM sliders WHERE 1=1");
        List<Object> params = new ArrayList<>();
        
        if (search != null && !search.isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search + "%");
        }
        
        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
            params.add(status);
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
            System.err.println("Error counting sliders: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    public Slider getSliderById(int sliderId) {
        String sql = "SELECT * FROM sliders WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sliderId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Slider slider = new Slider();
                    slider.setId(rs.getInt("id"));
                    slider.setTitle(rs.getString("title"));
                    slider.setImage_url(rs.getString("image_url"));
                    slider.setLink(rs.getString("link"));
                    slider.setDisplay_order(rs.getInt("display_order"));
                    slider.setStatus(rs.getString("status"));
                    slider.setNotes(rs.getString("notes"));
                    return slider;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting slider by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public boolean addSlider(Slider slider) {
        String sql = "INSERT INTO sliders (title, image_url, link, display_order, status, notes) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, slider.getTitle());
            st.setString(2, slider.getImage_url());
            st.setString(3, slider.getLink());
            st.setInt(4, slider.getDisplay_order());
            st.setString(5, slider.getStatus());
            st.setString(6, slider.getNotes());
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error adding slider: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSlider(Slider slider) {
        String sql = "UPDATE sliders SET title = ?, image_url = ?, link = ?, display_order = ?, " +
                    "status = ?, notes = ? WHERE id = ?";
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, slider.getTitle());
            st.setString(2, slider.getImage_url());
            st.setString(3, slider.getLink());
            st.setInt(4, slider.getDisplay_order());
            st.setString(5, slider.getStatus());
            st.setString(6, slider.getNotes());
            st.setInt(7, slider.getId());
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error updating slider: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSlider(int sliderId) {
        String sql = "DELETE FROM sliders WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sliderId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting slider: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean isDisplayOrderExists(int displayOrder, int excludeId) {
    String sql = "SELECT COUNT(*) FROM sliders WHERE display_order = ? AND id != ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, displayOrder);
        st.setInt(2, excludeId);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
    } catch (SQLException e) {
        System.err.println("Error checking display order: " + e.getMessage());
        e.printStackTrace();
    }
    return false;
}

    public static void main(String[] args) {
        SliderDAO sliderDAO = new SliderDAO();
        // Test code can be added here for debugging purposes
    }
}