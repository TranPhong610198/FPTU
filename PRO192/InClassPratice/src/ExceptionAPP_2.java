import java.util.Scanner;
public class ExceptionAPP_2{
    public ExceptionAPP_2(){}
    public int inputObj(Scanner in){
        int n;
        try {
            System.out.print("Enter a whole number: ");
            n = Integer.parseInt(in.nextLine());
            if( n<10 || n>50) throw new Exception();
        }
        catch (Exception e) {
            System.out.println("Required integer greater than 10 and less than 50!!!");
            n=0;
        }
        in.close();
        return n;
    }

    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        ExceptionAPP_2 obj = new ExceptionAPP_2();
        System.out.print("number: " + obj.inputObj(in));
    }
}