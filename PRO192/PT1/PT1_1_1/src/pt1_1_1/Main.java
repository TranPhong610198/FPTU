package pt1_1_1;

import java.util.*;
public class Main {
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        
        int r, c, sum = 0, count=0;
        double average;
        r = scan.nextInt();
        c = scan.nextInt();
        int[][] m = new int[r][c];
        
        for (int i=0; i<r; i++){
            for (int j=0; j<c; j++){
                m[i][j] = scan.nextInt();
            }
        }
        
        System.out.println("Matrix inputted:");
        for (int i=0; i<r; i++){
            for (int j=0; j<c; j++){
                System.out.print(m[i][j] + " ");
                sum += m[i][j];
                count++;
            }
            System.out.println();
        }
        average = (double) sum/count;
        System.out.println("Sum: "+ sum);
        System.out.println("Average: "+ average);
    }   
}
