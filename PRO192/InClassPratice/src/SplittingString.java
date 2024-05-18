import java.util.StringTokenizer;
public class SplittingString{
    public static void main(String[] args){
        String str = "I study hard. So, I pass the examination";
        
        String[] strs = str.split("[ ,.]+");
        for (String s:strs) System.out.println(s);
        System.out.println();
        
        StringTokenizer stk= new StringTokenizer(str,"[ ,.]");
        System.out.println("Number of substrings: "+stk.countTokens());
        
        while (stk.hasMoreTokens()) System.out.println(stk.nextToken());
    }
}