package bubblesort;
import java.util.*;
public class Main {
    
    public static void displayArr(int[] arr, String str) {
        System.out.print(str);
        System.out.println(Arrays.toString(arr));
    }
    
    public static void BubbleSort(int[] arr){
        boolean check;
        for (int i=0; i<arr.length; i++){
            check = false;
            for (int j=0; j<arr.length-1; j++){
                if (arr[j] > arr [j+1]){
                    int temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                    check = true;
                }
            }
            if (!check) break;
        }
    }
    
    public static int[] createRandomArr(int size){
        Random r = new Random();
        
        int[] arr = new int [size]; 
        for(int i=0; i<size; i++){
            arr[i] = r.nextInt(size);
        }
        return arr;
    }
    
    
    public static void main(String[] args) {
        
        Validation Valid = new Validation();

        int size = Valid.input("Enter Size Array: ");
        int[] arr = createRandomArr(size);
        
        displayArr(arr, "Unsorted Array: ");
        BubbleSort(arr);
        displayArr(arr, "Sorted Array" );
    }
}
