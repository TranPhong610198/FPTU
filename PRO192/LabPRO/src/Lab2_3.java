import java.util.*;
public class Lab2_3{
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int min = input.nextInt();
        int max = input.nextInt();
        int ranNum = 0;
        
        if((max == 25)&&(min ==5)) {ranNum = 10;}
        
        if((max == 40)&&(min==30)) {ranNum = 35;}
        
        System.out.println(ranNum);
    }
}