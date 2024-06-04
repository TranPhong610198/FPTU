/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package handyexpense;
import java.util.*;
/**
 *
 * @author tphon
 */
public class Function {
    Validation Valid = new Validation();
    
    public void displayMenu() {
        System.out.printf(
                "========== Handy Expense Program ==========\n"
                + "1.Add An Expense\n"
                + "2.Display All Expense\n"
                + "3.Delete An Expense\n"
                + "4.Quit\n");
    }
    
    public void addExp(List<Expense> exp){
        int id =1;
        if (!exp.isEmpty()){
            id = exp.get(exp.size()-1).getId() + 1;
        }
        
        String date = Valid.inputDate("Enter Date: ");
        
        double amount = Valid.inputDouble("Enter Amount: ", "ERROR Amount!!!", 1, Double.MAX_VALUE);

        String content = Valid.inputString("Enter Content: ");
        
        int index = -1;
        if (Valid.isDuplicate(exp, date, content)!=-1){
            index = Valid.isDuplicate(exp, date, content);
            amount += exp.get(index).getNumber();
        }
        
        Expense temp = new Expense(id, date, content.toLowerCase(), amount);
        exp.add(temp);
        
        if (index != -1){
            int idDel = Valid.isDuplicate(exp, date, content);
            for (int i=exp.size()-1; i>=idDel+1; i--){
                Expense tempDel = exp.get(i);
                int tempID = tempDel.getId();
                tempDel.setId(tempID-1);
                exp.set(i, tempDel);
            }
            
            exp.remove(idDel);
        }
    }
    
    public void displayExp(List<Expense> exp){
        System.out.println("---------Display all expenses------------\n" +
"ID 	Date	 	Amount    Content");
        
        double sum =0;
        for (Expense temp : exp){
            System.out.println(temp.toString());
            sum += temp.getNumber();
        }
        System.out.println("Total: "+ (int)sum);
    }
    
    public void delExp(List<Expense> exp){
        int id = Valid.inputId(exp);
        
        if (id != -1){
            for (int i=exp.size()-1; i>=id; i--){
                Expense temp = exp.get(i);
                int tempID = temp.getId();
                temp.setId(tempID-1);
                exp.set(i, temp);
            }
            
            exp.remove(id-1);
            System.out.println("\033[32mDelete an expense successful\033[0m");
     
        }
    }
}
