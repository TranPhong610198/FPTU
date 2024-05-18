/**
 * Anagram
 */
import java.util.*;
public class Anagram {
    public static String sortStr(String str){
        char[] temp = str.toCharArray();
        String result="";
        char tempCom;
        for (int i=0; i<temp.length-1; i++){
            for(int j= i+1; j<temp.length; j++){
                if (temp[i]>temp[j]){
                    tempCom = temp[i];
                    temp[i] = temp[j];
                    temp[j] = tempCom;
                }
            }
        }
        for (int i=0; i<temp.length; i++){
            result += temp[i];
        }
        return result.trim();
    }

    public static boolean isAnagram(String str1, String str2){
        if (sortStr(str1).compareTo(sortStr(str2)) == 0) return true;
        return false;
    }    

    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        String str1 = scan.nextLine();
        System.out.println(sortStr(str1));
        // scan.nextLine();
        
        String str2 = scan.nextLine();
        System.out.println(sortStr(str2));
        // scan.nextLine();
        
        System.out.println(isAnagram(str1, str2));
        scan.close();
    }
}