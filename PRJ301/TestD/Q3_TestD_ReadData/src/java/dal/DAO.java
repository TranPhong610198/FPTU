/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import java.util.ArrayList;
import java.util.List;
import model.ExecutionItems;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Executions;
import model.Result;

/**
 *
 * @author tphon
 */
public class DAO extends DBContext {

    public List<Result> getAll() {
        List<Result> items = new ArrayList<>();
        try {
            String query = "SELECT e.ExecutionID, \n"
                    + "       STRING_AGG(ei.ArrayItem, ' ') AS ArrayItems,\n"
                    + "       e.Result\n"
                    + "FROM Executions e\n"
                    + "JOIN ExecutionItems ei ON e.ExecutionID = ei.ExecutionID\n"
                    + "GROUP BY e.ExecutionID, e.Result";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Result item = new Result();
                item.setId(rs.getInt(1));
                item.setArray(rs.getString(2));
                item.setResult(rs.getInt(3));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public Result getResultById(int id) {
        try {
            String query = "SELECT e.ExecutionID, \n"
                    + "       STRING_AGG(ei.ArrayItem, ' ') AS ArrayItems,\n"
                    + "       e.Result\n"
                    + "FROM Executions e\n"
                    + "JOIN ExecutionItems ei ON e.ExecutionID = ei.ExecutionID\n"
                    + "WHERE e.ExecutionID = ?\n"
                    + "GROUP BY e.ExecutionID, e.Result";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                Result item = new Result();
                item.setId(rs.getInt(1));
                item.setArray(rs.getString(2));
                item.setResult(rs.getInt(3));
                return item;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void delete(int executionId) {
        try {
            String query = "DELETE FROM ExecutionItems WHERE ExecutionID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, executionId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Executions getExecutionByID(int executionId) {
        Executions execution = null;
        try {
            String query = "SELECT * FROM Executions WHERE ExecutionID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, executionId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                execution = new Executions();
                execution.setExecutionId(rs.getInt("ExecutionID"));
                execution.setResult(rs.getInt("Result"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return execution;
    }
}
