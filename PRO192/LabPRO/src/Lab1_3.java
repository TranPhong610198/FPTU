import java.util.*;
public class Lab1_3{
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int seconds = input.nextInt();
        int tempt = seconds;
        
        int hour = tempt/3600;
        tempt = tempt%3600;
        
        int minutes = tempt/60;
        tempt = tempt%60;
        
        System.out.print(hour);
        System.out.print(minutes);
        System.out.print(tempt);
    }
}
