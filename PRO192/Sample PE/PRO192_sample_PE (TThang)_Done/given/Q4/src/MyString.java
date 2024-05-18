import java.util.*;
public class MyString implements IString{
    
    public boolean isPrime(int num){
        if (num == 0) return false;
        else if (num ==1) return false;
        else {
            for (int i=2; i<= Math.sqrt(num); i++){
                if (num%i == 0) return false;
            }
            return true;
        }
    }
    
    @Override
    public int f1(String str) {
        int count = 0, test;
        int n = str.length();
        for (int i=0; i<n; i++){
            if (Character.isDigit(str.charAt(i))){
                if(isPrime(Integer.parseInt(str.charAt(i)+""))) 
                    count++;
            }
        }
        return count;
    }

    public void reverse(char[] s, int start, int end){
        while(start<=end){
        char temp;
        temp = s[start]; 
        s[start] = s[end];
        s[end] = temp;
        end --;
        start ++;
        }
    }
    
    public char[] reverseAll (char[] s){
        int start=0;
        for (int i=0; i<s.length; i++){
            if (s[i] == ' '){
                reverse(s, start, i-1);
                start = i+1;
            }
        }
        
        reverse (s, start, s.length-1);
        
        reverse (s, 0, s.length-1);
        return s;
    }
    
    @Override
    public String f2(String str) {
        char[] p = reverseAll(str.toCharArray());
        String result = String.valueOf(p);
        return result;
    }
}   
