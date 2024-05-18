import java.util.Scanner;
public class StringDemo{
    public static void main(String args[]){
        Scanner scan= new Scanner(System.in);
        
        String origin, replaced, replacement;
        
        System.out.print("Enter original string:");
        origin= scan.nextLine();
        
        System.out.print("Enter replaced string:");
        replaced= scan.nextLine();
        
        System.out.print("Enter replacing string:");
        replacement= scan.nextLine();
        
        origin = origin.replaceAll(replaced, replacement);
        
        System.out.println("After replacing:"+origin);
        System.out.println("Uppercase:"+origin.toUpperCase());
        System.out.println("Origin:"+origin);
        System.out.print("Enter the index of extracted character:");
        
        int index= Integer.parseInt(scan.nextLine());
        System.out.format("The %d(th)character:%c\n", index, origin.charAt(index));
        scan.close();
    }
}