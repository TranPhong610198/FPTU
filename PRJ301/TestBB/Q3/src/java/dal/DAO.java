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
import model.Suppliers;

/**
 *
 * @author tphon
 */
public class DAO extends DBContext {

    public List<Suppliers> getAll() {
        List<Suppliers> list = new ArrayList<>();
        String sql = "select * from Suppliers";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Suppliers temp = new Suppliers();
                temp.setCode(rs.getString("SupplierID"));
                temp.setName(rs.getString("SupplierName"));
                temp.setBirth(rs.getString("BirthDate"));
                temp.setGender(rs.getBoolean("Gender"));
                temp.setAddress(rs.getString("Address"));
                list.add(temp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Suppliers> Fill(String name) {
        List<Suppliers> list = new ArrayList<>();
        String sql = "select * from Suppliers where SupplierName=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Suppliers temp = new Suppliers();
                temp.setCode(rs.getString("SupplierID"));
                temp.setName(rs.getString("SupplierName"));
                temp.setBirth(rs.getString("BirthDate"));
                temp.setGender(rs.getBoolean("Gender"));
                temp.setAddress(rs.getString("Address"));
                list.add(temp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Suppliers> getByYear(String name) {
        List<Suppliers> list = new ArrayList<>();
        String sql = "select * from Suppliers where BirthDate=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Suppliers temp = new Suppliers();
                temp.setCode(rs.getString("SupplierID"));
                temp.setName(rs.getString("SupplierName"));
                temp.setBirth(rs.getString("BirthDate"));
                temp.setGender(rs.getBoolean("Gender"));
                temp.setAddress(rs.getString("Address"));
                list.add(temp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void delete(String id) {
        String sql = "delete from suppliers where supplierid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
