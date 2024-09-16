/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package reversestring;

//import java.util.Scanner;
import java.util.*;

/**
 *
 * @author tphon
 */
public class ReverseString {

    public static String strChallenge(String str) {
        char[] strArr = str.toCharArray();
        for (int i = 0; i < strArr.length; i++) {
            if (strArr[i] != 'z' && Character.isAlphabetic(strArr[i])) {
                strArr[i]++;
                if (strArr[i]=='u' || strArr[i]=='e' || strArr[i]=='o' || strArr[i]=='a' || strArr[i]=='i'){
                    strArr[i] = Character.toUpperCase(strArr[i]);
                }
            }
            else if (strArr[i] =='z'){
                strArr[i] = 'A';
                
            }
        }
        str = String.copyValueOf(strArr);
        return str;
    }
    
    public static String strReverse(String str){
        char[] strArr = str.toCharArray();
        char temp ;
        for (int i=0; i< (strArr.length-1)/2; i++){
            temp = strArr[i];
            strArr[i] = strArr[strArr.length-1-i];
            strArr[strArr.length-1-i] = temp;
        }
        str = String.copyValueOf(strArr);
        return str;
    }
    
    public static String maxLengthWord(String str){
        String result=""; 
        int max=0, count=0, index=0;
        int start=0, end =0, realStart=0, realEnd=0; 
        char[] strArr = str.toCharArray();
        int i=0, j=0;
        while(i<strArr.length-1){
            start = i;
            while(Character.isAlphabetic(strArr[i]) && i<strArr.length-1){
                count++;
                i++;
                index = i;
            }
            end = index;
            
            if(max<count){
                max = count;
                count = 0;
                realStart = start;
                realEnd = end;
            }
            else{
                count =0;
            }
            while(!Character.isAlphabetic(strArr[i]) && i<strArr.length-1){
                i++;
            }
        }
        for ( j =realStart; j<= realEnd;j++){
            result += strArr[j];
        }
        return result;
                
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner scan = new Scanner(System.in);
        System.out.println("Input string: ");
        String str = scan.nextLine();
        System.out.println("String after challenge: "+strChallenge(str));
        System.out.println("String after reverse: "+strReverse(str));
        System.out.println("Max length word: "+maxLengthWord(str));
    }

}
