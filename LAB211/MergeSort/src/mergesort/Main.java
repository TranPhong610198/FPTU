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

    public int[] merge(int[] arr1, int[] arr2){
        int size = arr1.length + arr2.length;
        int[] result = new int[size];

        int i = 0, i1 = 0, i2 = 0;
        while (i1 < arr1.length || i2 < arr2.length) {
            if (i1 == arr1.length && i2 < arr2.length) {
                result[i] = arr2[i2];
                i2++;
                i++;
            } else if (i2 == arr2.length && i1 < arr1.length) {
                result[i] = arr1[i1];
                i1++;
                i++;
            } else if (arr1[i1] < arr2[i2]) {
                result[i] = arr1[i1];
                i1++;
                i++;
            } else {
                result[i] = arr2[i2];
                i2++;
                i++;
            }
        }
        return result;
    }
    
    public int[] mergeSort(int[] arr, int l, int r) {
        if (l > r) {
            return new int[0];
        }
        if (l == r) {
            int[] singleElement = {arr[l]};
            return singleElement;
        }
        int m = (l + r) / 2;
        int[] arr1 = mergeSort(arr, l, m);
        int[] arr2 = mergeSort(arr, m + 1, r);

        int[] result = merge(arr1, arr2);
        return result;
//        int size = arr1.length + arr2.length;
//        int[] result = new int[size];
//
//        int i = 0, i1 = 0, i2 = 0;
//        while (i1 < arr1.length && i2 < arr2.length) {
//            if (i1 == arr1.length && i2 < arr2.length) {
//                result[i] = arr2[i2];
//                i2++;
//                i++;
//            } else if (i2 == arr2.length && i1 < arr1.length) {
//                result[i] = arr1[i1];
//                i1++;
//                i++;
//            } else if (arr1[i1] < arr2[i2]) {
//                result[i] = arr1[i1];
//                i1++;
//                i++;
//            } else {
//                result[i] = arr2[i2];
//                i2++;
//                i++;
//            }
//        }
//        return result;
    }

    public static void main(String[] args) {
        Validation Valid = new Validation();
        Main Obj = new Main();
        
        int size = Valid.input("Enter Size Array: ");
        int[] arr = Obj.createRandomArr(size);

        Obj.displayArr(arr, "Unsorted Array: ");
        arr = Obj.mergeSort(arr, 0, arr.length-1);
        Obj.displayArr(arr, "Sorted Array");
    }
}
