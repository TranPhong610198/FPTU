import java.util.*;
public class Lab2_9{
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        int n;
        float sum =0;
        n = scan.nextInt();
        int [] arr = new int[n];
        for (int i=0; i<n; i++){
            arr[i] = scan.nextInt();
        }
        for (int num :arr)  sum+= (float) num;
        System.out.printf("%.2f",sum);
    }
}