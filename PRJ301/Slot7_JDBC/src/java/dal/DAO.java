/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tphon
 */
public class DAO extends DBContext {

    // Read - select - List 
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category temp = new Category();
                temp.setId(rs.getInt("id"));
                temp.setName(rs.getString("name"));
                temp.setDescribe(rs.getString("describe"));
                list.add(temp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void delete(int id) {
        String sql = "delete from categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Category c) {
        String sql = "insert into Categories values (?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDescribe());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Category getCategoryByID(int id) {
        String sql = "select * from Categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category temp = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("describe"));
                return temp;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void update(Category c){
        String sql = "update Categories set name = ?, describe =? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescribe());
            st.setInt(3, c.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public static void main(String[] args){
//        DAO d = new DAO();
//        List<Category> list = d.getAll();
//        
//        System.out.println(list.get(0).getName());
//    }
}
