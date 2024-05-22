/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package quicksort;

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
        public void displayArr(int[] arr, String str) {
        System.out.print(str);
        System.out.println(Arrays.toString(arr));
    }

    public int[] createRandomArr(int size) {
        Random r = new Random();

        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = r.nextInt(size);
        }
        return arr;
    }

    public int partition(int[] arr, int l, int r, int key){
        int iL = l;
        int iR = r;
        while (iL<=iR){
            while (arr[iL] < key) iL++;
            while (arr[iR] > key) iR--;
        
            if(iL<=iR){
                int temp = arr[iL];
                arr[iL] = arr[iR];
                arr[iR] = temp;
                iL++; iR--;
            }
        }
        return iL;
    }
    
    public void quickSort(int[] arr, int l, int r) {
        if (l>=r) return ;
        
        int key = arr[(l+r)/2];
        int k = partition(arr, l, r, key);
        
        quickSort(arr, l, k-1);
        quickSort(arr, k, r);
    }

    public static void main(String[] args) {
        Validation Valid = new Validation();
        Main Obj = new Main();
        
        int size = Valid.input("Enter Size Array: ");
        int[] arr = Obj.createRandomArr(size);

        Obj.displayArr(arr, "Unsorted Array: ");
        Obj.quickSort(arr, 0, arr.length-1);
        Obj.displayArr(arr, "Sorted Array");
    }
    
}
