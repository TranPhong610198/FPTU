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
public class Validation {
    public int input(String str){
        Scanner scan = new Scanner(System.in);
        do {            
            try{
                System.out.println(str);
                int temp = Integer.parseInt(scan.nextLine().trim());
                if (temp<=0) throw new Exception();
                return temp;
            }catch (Exception e){
                System.err.println("Input EROR!!! Enter Again: ");
            }
        } while (true);
    }
}
