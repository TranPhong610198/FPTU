/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package j1.s.p0071;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;
/**
 *
 * @author tphon
 */
public class Validation {
  
    public int inputInt(String msg, String err, int MIN, int MAX){
        Scanner scan = new Scanner(System.in);
        
        while(true){
            System.out.print(msg);
            try {
                int input = Integer.parseInt(scan.nextLine().trim());
                if (input>MAX || input<MIN) throw new Exception();
            } catch (Exception e) {
                System.err.println(err);
            }
        }
    }
    
    public String inputStr(String msg){
        Scanner scan = new Scanner(System.in);
        
        while(true){
            System.out.print(msg);
            try {
                String input = scan.nextLine().trim();
                if (input == null || input.isEmpty()) throw new Exception();
                return input;
            } catch (Exception e) {
                System.err.println("Can't be empty!!!");
            }
        }
    }
    
    public String inputDate(){
        Scanner scan = new Scanner(System.in);
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        
        while(true){
            try{
            System.out.print("Date: ");
            Date date = dateFormat.parse(scan.nextLine());
            }catch(ParseException e){
                System.err.println("Error date format dd-MM-yyyy!!!!");
            }
        }
    }
    
    public double inputFrom(){
        Scanner scan = new Scanner(System.in);
        Pattern patt = Pattern.compile("^(8|9|1[0-7])(\\.0|\\.5)?$");
        
        while(true){
            System.out.print("From: ");
            try {
                String input = scan.nextLine();
                if (!patt.matcher(input).matches())
                    throw new InputMismatchException();
                return Double.parseDouble(input);
            } catch (InputMismatchException e) {
                System.err.println("Time Invalid!!! 8-17.5");
            }
        }
    }
    
    public double inputTo(Double from){
        Scanner scan = new Scanner(System.in);
        Pattern patt = Pattern.compile("^(8|9|1[0-7])(\\.0|\\.5)?$");
        
        while(true){
            System.out.print("To: ");
            try {
                String input = scan.nextLine();
                if (!patt.matcher(input).matches())
                    throw new InputMismatchException();
                if (Double.parseDouble(input) < from)
                    throw new UnknownError();
                return Double.parseDouble(input);
            } catch (InputMismatchException e) {
                System.err.println("Time Invalid!!! 8-17.5");
            } catch (UnknownError e){
                System.err.println("End time must greater than start!!!");
            }
        }
    }
    
}
