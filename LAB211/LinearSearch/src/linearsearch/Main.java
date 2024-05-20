/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package linearsearch;

import java.util.Arrays;
import java.util.Random;

/**
 *
 * @author tphon
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void displayArr(int[] arr, String str) {
        System.out.print(str);
        String result = Arrays.toString(arr);
        System.out.println(result);
    }

    public static int[] creatRanArr(int size) {
        Random ran = new Random();
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = ran.nextInt(size);
        }
        return arr;
    }

    public static int linearSearch(int[] arr, int value){
        int findIndex;
        for (int i=0; i<arr.length; i++){
            if (arr[i] == value){
                findIndex = i;
                return findIndex;
            }
        }
        return -1;
    }
    
    public static void main(String[] args) {
        Validation Valid = new Validation();
        int size = Valid.input("Enter size array: ");
        
        int[] arr = creatRanArr(size);
        displayArr(arr, "Unsorted array: ");
        
        int value = Valid.inputValue("Enter value: ");
        if(linearSearch(arr, value) == -1)
            System.out.println(value+" not exist in array.");
        else
            System.out.println("Find "+ value + " at " + linearSearch(arr, value));
    }

}
