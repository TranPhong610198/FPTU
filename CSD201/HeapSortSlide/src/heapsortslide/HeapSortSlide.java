/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package heapsortslide;

/**
 *
 * @author tphon
 */
public class HeapSortSlide {

    static void printArray(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n; ++i) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();

    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        int a[] = {1, 12, 9, 5, 6, 10};
        int n = a.length;

        int i, s, f;
        int x;
        for (i = 1; i < n; i++) {
            x = a[i];
            s = i; //s  is a son,f=(s-1)/2 is father
            while (s > 0 && x > a[(s - 1) / 2]) {
                a[s] = a[(s - 1) / 2];
                s = (s - 1) / 2;
            }
            a[s] = x;
        }

        for (i = n - 1; i > 0; i--) {
            x = a[i];
            a[i] = a[0];
            f = 0; //f is father
            s = 2 * f + 1; //s is a left son
            // if the right son is larger then it is selected
            if (s + 1 < i && a[s] < a[s + 1]) {
                s = s + 1;
            }
            while (s < i && x < a[s]) {
                a[f] = a[s];
                f = s;
                s = 2 * f + 1;
                if (s + 1 < i && a[s] < a[s + 1]) {
                    s = s + 1;
                }
            };
            a[f] = x;
        };

        
        System.out.println("Sorted array is");
        printArray(a);
    
    }

}
