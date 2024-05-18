import java.util.Scanner;
public class ExceptionAPP_3{
    public static int inputInteger() throws Exception{
        Scanner in = new Scanner(System.in);
        System.out.print("Enter a whole number: ");
        int n = Integer.parseInt(in.nextLine());
        if( n<10 || n>50) throw new Exception();
        in.close();
        return n;

    }

    public static void main(String[] args){
        int n=0;
        try{  
            n= inputInteger();
        }
        catch(Exception e){
            System.out.println("Required integer!"); 
        }
        System.out.print("number: "+ n);
    }
}