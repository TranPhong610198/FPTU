/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Result {
    int id, result;
    String array;

    public Result() {
    }

    public Result(int id, int result, String array) {
        this.id = id;
        this.result = result;
        this.array = array;
    }

    public String getArray() {
        return array;
    }

    public int getId() {
        return id;
    }

    public int getResult() {
        return result;
    }

    public void setArray(String array) {
        this.array = array;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setResult(int result) {
        this.result = result;
    }
    
}
