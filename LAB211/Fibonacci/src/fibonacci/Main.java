/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package fibonacci;

/**
 *
 * @author tphon
 */
public class Main {

    public static int fibonacci(int num){
        if(num == 0) return 0;
        else if (num == 1) return 1;
        else return fibonacci(num-1) + fibonacci(num-2);
    }
    
    public static void main(String[] args) {
        System.out.println("The sequence 45 fibonacci: ");
        for (int i=0; i<45; i++){
            System.out.print(fibonacci(i)+", ");
        }
    }
    
}
