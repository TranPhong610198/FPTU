/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tphon
 */
public class Admin {
    private String username, password;
    private int role;

    public Admin() {
    }

    public Admin(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getRole() {
        return role;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
    
}
