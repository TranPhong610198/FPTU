/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Admin;
import model.Student;

/**
 *
 * @author tphon
 */
public class DAO extends DBContext {

    public Admin checkAuthen (String username, String password){
        String sql="select * from admin where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            
            if(rs.next()){
                return new Admin(username, password, rs.getInt("role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    // Read - select - List 
    public List<Student> getAll() {
        List<Student> list = new ArrayList<>();
        String sql = "select * from Student";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Student temp = new Student();
                temp.setId(rs.getString("id"));
                temp.setName(rs.getString("name"));
                temp.setDob(rs.getString("dob"));
                temp.setGender(rs.getBoolean("gender"));
                temp.setAddress(rs.getString("address"));
                list.add(temp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void delete(String id) {
        String sql = "delete from student where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Student c) {
        String sql = "insert into student values (?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDob());
            st.setBoolean(4, c.isGender());
            st.setString(5, c.getAddress());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Student getStudentByID(String id) {
        String sql = "select * from student where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String tempId = rs.getString("id");
                String tempName = rs.getString("name");
                String tempDob = rs.getString("dob");
                Boolean tempGender = rs.getBoolean("gender");
                String tempAddress = rs.getString("address");
                Student temp = new Student(tempId, tempName, tempDob, tempAddress, tempGender);
                return temp;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void update(Student c){
        String sql = "update student     set name = ?, dob =?, gender=?, address=? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDob());
            st.setBoolean(3, c.isGender());
            st.setString(4, c.getAddress());
            st.setString(5, c.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args){
        DAO d = new DAO();
        List<Student> list = d.getAll();
        
        System.out.println(list.get(0).getName());
    }
}
