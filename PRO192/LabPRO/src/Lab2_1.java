import java.util.*;
import java.lang.*;
public class Lab2_1{
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        float PV = input.nextFloat();
        float I = input.nextFloat();
        float n = input.nextFloat();
        float FV;
        
        FV = PV * (float) Math.pow((1+I), n);
        
        System.out.printf("%.2f", FV);
    }
}