/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package lab1swt;

import java.util.ArrayList;

/**
 *
 * @author tphon
 */
public class Lab1SWT {

    /**
     * @param args the command line arguments
     */
    public ArrayList<Integer> vicDiff(int[] ar1, int[] ar2){
        ArrayList<Integer> Output = null;
        int[] ar1 = {};
        boolean found;
        if(ar1!=null && ar2!=null){
            Output = new ArrayList<Integer>();
            for(int item:ar1){
                int i;
                found = false;
                System.out.println(found);
                while(i<=ar2.length && found == false){
                    if (item == ar2[i])
                        found = true;
                    i++;
                }
                if (found)
                    Output.add(item);
            }
        }
        return Output;
    }
    
    public static void main(String[] args) {
        // TODO code application logic here
        
    }
    
}
