/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package handyexpense;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tphon
 */
public class Validation {
        public int inputInt(String msg, String wrongMsg, int MIN, int MAX) {
        Scanner scan = new Scanner(System.in);
        
        while (true) {
            System.out.print(msg);
            try {
                int temp = Integer.parseInt(scan.nextLine().trim());
                if (temp < MIN || temp > MAX) {
                    throw new NumberFormatException();
                }
                return temp;
            } catch (NumberFormatException e) {
                System.err.print(wrongMsg);
            }
        }
    }

    public String inputString(String str) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            try {
                System.out.print(str);
                String input = scanner.nextLine();
                if (input == null || input.trim().isEmpty()) {
                    throw new Exception("String can't be empty!!!");
                }
                return input;
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
    }
    
    public String inputDate(String str) {
        Scanner scan = new Scanner(System.in);
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat dateParse = new SimpleDateFormat("dd-MMM-yyyy");
        dateFormat.setLenient(false);

        
        while (true) {
            System.out.print(str);
            try {
                Date date = dateFormat.parse(scan.nextLine());
                Date now = new Date();
                if (date.after(now)) throw new Error();
                return dateParse.format(date);
            } catch (ParseException e) {
                System.err.println("Enter with date format dd/MM/yyyy!!!");
            } catch (Error e){
                System.err.println("Can't enter future!!!");
            }
        }
    }
    
    public double inputDouble(String msg, String err, double MIN, double MAX){
        Scanner scan = new Scanner(System.in);
        
        while(true){
            System.out.print(msg);
            try {
                double input = Double.parseDouble(scan.nextLine().trim());
                if (input<MIN || input>MAX)
                    throw new Exception();
                return input;
            } catch (Exception e) {
                System.err.println(err);
            }
        }
    }
    
    public int inputId(List<Expense> exp){
        Scanner scan = new Scanner(System.in);
        
        System.out.print("Enter ID: ");
        int id = Integer.parseInt(scan.nextLine());
        if (id <=0 || id >exp.size()){
            System.err.println("Delete an expense fail");
            return -1;
        }
        else
            return id;
    }
    
    public int isDuplicate(List<Expense> exp, String date, String content){
        for(int i=0 ; i<exp.size(); i++){
            Expense temp = exp.get(i);
            if (temp.getDate().equals(date) && temp.getContent().equalsIgnoreCase(content)){
                return i;
            }
        }
        return -1;
    }
    
}
