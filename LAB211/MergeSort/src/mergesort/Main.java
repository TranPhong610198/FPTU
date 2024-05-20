/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package mergesort;

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
        System.out.println(Arrays.toString(arr));
    }

    public static int[] createRandomArr(int size){
        Random r = new Random();
        
        int[] arr = new int [size]; 
        for(int i=0; i<size; i++){
            arr[i] = r.nextInt(size);
        }
        return arr;
    }
    
    
    public static void mergeSort(int[] arr){
        
    }
    

    public static void main(String[] args) {
        Validation Valid = new Validation();

        int size = Valid.input("Enter Size Array: ");
        int[] arr = createRandomArr(size);
        
        displayArr(arr, "Unsorted Array: ");
        mergeSort(arr);
        displayArr(arr, "Sorted Array" );
    }
}
