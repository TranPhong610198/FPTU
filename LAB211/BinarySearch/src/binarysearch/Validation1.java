/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package binarysearch;
import java.util.*;
/**
 *
 * @author tphon
 */
public class Validation1 {
    public int input(String str){
        Scanner scan = new Scanner(System.in);
        do {            
            try{
                System.out.println(str);
                int temp = Integer.parseInt(scan.nextLine().trim());
                if (temp<=0) throw new Exception("Input EROR!!! Enter Again: ");
                return temp;
            }catch (Exception e){
                System.err.println(e.getMessage());
            }
        } while (true);
    }
}
