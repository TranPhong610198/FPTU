import java.util.Scanner;
public class InOut{
    public static void main(String args[]){
        int a[];
        int n, i;
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Enter number of elements: ");
        n=Integer.parseInt(sc.nextLine());
        a=new int[n];
        
        for (i=0; i<n; i++){
            System.out.print("Enter ther "+(i+1)+"/"+n+" element: ");
            a[i]=Integer.parseInt(sc.nextLine());
        }
        
        System.out.print("Entered values: ");
        for (i=0; i<n; i++) System.out.format("%5d", a[i]);
        int S=0;
        for (int x:a) S+=x;
        System.out.println("\nSum of values: " + S);
    }
}