/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package insertionsort;

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
        
    public static void insertionSort(int[] arr){
        int size = arr.length;
        for (int step=1; step<size; step++){
            int key = arr[step];
            int i = step-1;
            while (i>=0 && arr[i]>key){
                arr[i+1] = arr[i];
                i--;
            }
            arr[i+1] = key;
        }
    }
    

    public static void main(String[] args) {
        Validation Valid = new Validation();

        int size = Valid.input("Enter Size Array: ");
        int[] arr = createRandomArr(size);
        
        displayArr(arr, "Unsorted Array: ");
        insertionSort(arr);
        displayArr(arr, "Sorted Array" );

    }
    
}
