package pt1_1_2;
import java.util.*;
public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        try{
            int num = scan.nextInt();
            if (num<1)
                System.out.println("The number is invalid.");
            else
                System.out.println("The number is " + num +".");
        }catch(Exception e){
            System.out.println("The number is invalid.");
        }finally{
            scan.close();
        }
    }
}


