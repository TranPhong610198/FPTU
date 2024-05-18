import java.util.Scanner;

public class ExceptionAPP_1{
    public ExceptionAPP_1(){
    } 
    public int inputObj(Scanner in){   
        int n;
        try {
            System.out.printf("Enter a whole number: ");
            n = Integer.parseInt(in.nextLine());
        }
        catch (NumberFormatException e) {
            System.out.println("Required integer!");
            n=0;
        }
        return n;
    }
    
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        ExceptionAPP_1 obj = new ExceptionAPP_1();
        System.out.printf("number:  " + obj.inputObj(in));
   }
}