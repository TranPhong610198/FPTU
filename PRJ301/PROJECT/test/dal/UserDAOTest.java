/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.util.List;
import model.User;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author tphon
 */
public class UserDAOTest {
    
    public UserDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of login method, of class UserDAO.
     */
    @Test
    public void testLogin() {
        System.out.println("login");
        String username = "";
        String password = "";
        UserDAO instance = new UserDAO();
        User expResult = null;
        User result = instance.login(username, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of register method, of class UserDAO.
     */
    @Test
    public void testRegister() throws Exception {
        System.out.println("register");
        User user = null;
        UserDAO instance = new UserDAO();
        instance.register(user);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAll method, of class UserDAO.
     */
    @Test
    public void testGetAll() {
        System.out.println("getAll");
        UserDAO instance = new UserDAO();
        List<User> expResult = null;
        List<User> result = instance.getAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteUser method, of class UserDAO.
     */
    @Test
    public void testDeleteUser() {
        System.out.println("deleteUser");
        int userId = 0;
        UserDAO instance = new UserDAO();
        instance.deleteUser(userId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateUser method, of class UserDAO.
     */
    @Test
    public void testUpdateUser() {
        System.out.println("updateUser");
        String email = "";
        String phone = "";
        String address = "";
        int id = 0;
        String name = "";
        UserDAO instance = new UserDAO();
        instance.updateUser(email, phone, address, id, name);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateAvt method, of class UserDAO.
     */
    @Test
    public void testUpdateAvt() {
        System.out.println("updateAvt");
        String avtUrl = "";
        int id = 0;
        UserDAO instance = new UserDAO();
        instance.updateAvt(avtUrl, id);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserById method, of class UserDAO.
     */
    @Test
    public void testGetUserById() {
        System.out.println("getUserById");
        int id = 0;
        UserDAO instance = new UserDAO();
        User expResult = null;
        User result = instance.getUserById(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserByName method, of class UserDAO.
     */
    @Test
    public void testGetUserByName() {
        System.out.println("getUserByName");
        String name = "";
        UserDAO instance = new UserDAO();
        User expResult = null;
        User result = instance.getUserByName(name);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of blockUser method, of class UserDAO.
     */
    @Test
    public void testBlockUser() {
        System.out.println("blockUser");
        int userId = 0;
        boolean block = false;
        UserDAO instance = new UserDAO();
        instance.blockUser(userId, block);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateRole method, of class UserDAO.
     */
    @Test
    public void testUpdateRole() {
        System.out.println("updateRole");
        int userId = 0;
        String newRole = "";
        UserDAO instance = new UserDAO();
        instance.updateRole(userId, newRole);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of resetPassword method, of class UserDAO.
     */
    @Test
    public void testResetPassword() {
        System.out.println("resetPassword");
        int userId = 0;
        String newPassword = "";
        UserDAO instance = new UserDAO();
        instance.resetPassword(userId, newPassword);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
