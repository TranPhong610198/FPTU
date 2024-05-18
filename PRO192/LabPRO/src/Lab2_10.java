import java.util.*;
public class Lab2_10 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int month = input.nextInt();
        int date = input.nextInt();
        int day = 0;
        
        for (int i=1; i<month; i++){
            switch(i){
                case 4:
                case 6:
                case 9:
                case 11: 
                    day += 30;
                    break;
                case 2:
                    day += 29;
                    break;
                default:
                    day += 31;
                    break;
            }
        }
        day = day + date - 1;
        int temp = day%7;
        switch(temp){
            case 0: System.out.println("Thursday"); break;
            case 1: System.out.println("Friday"); break;
            case 2: System.out.println("Saturday"); break;
            case 3: System.out.println("Sunday"); break;
            case 4: System.out.println("Monday"); break;
            case 5: System.out.println("Tuesday"); break;
            case 6: System.out.println("Wednesday"); break;
        }    
    }
}
