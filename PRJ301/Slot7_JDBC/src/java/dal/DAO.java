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
public class DAO extends DBContext{
    // Read - select - List 
    public List<Category> getAll(){
        List<Category> list = new ArrayList<>();
        String sql="select * from Categories";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
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
    
//    public static void main(String[] args){
//        DAO d = new DAO();
//        List<Category> list = d.getAll();
//        
//        System.out.println(list.get(0).getName());
//    }
}
