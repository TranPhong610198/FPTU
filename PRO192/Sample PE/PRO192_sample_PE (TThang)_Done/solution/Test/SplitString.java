// import java.util.Arrays;

class SplitString {
 
    // Reverse the letters
    // of the word
    static void reverse(char str[], int start, int end)
    {
        char temp;
 
        while (start <= end) {
            temp = str[start];
            str[start] = str[end];
            str[end] = temp;
            start++;
            end--;
        }
    }
    // Function to reverse words
    static char[] reverseWords(char[] s)
    {
        int start = 0;
        for (int end = 0; end < s.length; end++) {
          
            if (s[end] == ' ') {
                reverse(s, start, end-1);
                start = end + 1;
            }
        }
 
        reverse(s, start, s.length-1);
        reverse(s, 0, s.length - 1);
        return s;
    }
 
    // Driver Code
    public static void main(String[] args)
    {
        String s = "a9 b1 a8 a7 a6 a5";
        char[] p = s.toCharArray();

        System.out.println(p);
        char[] charResult = reverseWords(p);

        System.out.println(charResult);

        String result = String.valueOf(charResult);
        System.out.println(result);
    }
}
