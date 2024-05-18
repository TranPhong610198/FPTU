/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package binarysearch;

import java.util.*;

/**
 *
 * @author tphon
 */
public class Main {

    public void displayArr(int[] arr, String str) {
        System.out.print(str);
        String result = Arrays.toString(arr);
        System.out.println(result);
    }

    public int[] creatRanArr(int size) {
        Random ran = new Random();
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = ran.nextInt(size);
        }
        return arr;
    }

    public void bubbleSort(int[] arr) {
        boolean check;
        for (int i = 0; i < arr.length; i++) {
            check = false;
            for (int j = 0; j < arr.length - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    check = true;
                }
            }
            if (!check) {
                break;
            }
        }
    }

    public int binarySearch(int[] arr, int value) {
        int start = 0, end = arr.length-1;

        while (start <= end) {
            int mid = (start + end) / 2;
            if (value == arr[mid]) {
                return mid;
            } else if (value < arr[mid]) {
                end = mid - 1;
            } else {
                start = mid + 1;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        Validation Valid = new Validation();
        Main Obj = new Main();

        int size = Valid.input("Enter size array: ");

        int[] arr = Obj.creatRanArr(size);
        Obj.bubbleSort(arr);
        Obj.displayArr(arr, "Sorted array: ");

        int value = Valid.input("Input value: ");
        if (Obj.binarySearch(arr, value) == -1) {
            System.out.println(value + " not exist in array.");
        } else {
            System.out.println("Find " + value + " at index: " + Obj.binarySearch(arr, value));
        }
    }

}
