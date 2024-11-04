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
import model.Ram;

/**
 *
 * @author tphon
 */
public class RamDAO extends DBContext{
        public List<Ram> getAll() {
        List<Ram> rams = new ArrayList<>();
        String sql = "SELECT * FROM ram";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                rams.add(new Ram(
                        resultSet.getInt("ram_id"),
                        resultSet.getString("ram_size")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return rams;
    }

    public void addRam(String name) {
        String sql = "INSERT INTO ram (ram_size) VALUES (?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void updateRam(Ram brand){
        String sql = "UPDATE ram SET ram_size = ? WHERE ram_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, brand.getRamSize());
            statement.setInt(2, brand.getRamId());
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public void deleteRam(int ramId) {
        String sql = "DELETE FROM ram WHERE ram_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ramId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
