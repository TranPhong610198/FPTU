/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author nguye
 */

public class MaHoa {
    public static String toBcrypt(String pass){
        String result = null;
        try {
              BCrypt b = new BCrypt();
              result = b.hashpw(pass, b.gensalt());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args) {
        System.out.println(toBcrypt("123"));
        System.out.println(toBcrypt("123"));
        
        System.out.println(BCrypt.checkpw("123","$2a$10$coNWWiUvQoYVI.WGi0s3h.LUeMK5ODMRtMjN0IV0Il8cazSRb4sGW"));
    }
}