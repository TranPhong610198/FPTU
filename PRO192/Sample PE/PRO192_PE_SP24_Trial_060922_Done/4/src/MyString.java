
public class MyString implements IString{
    
    
    
    @Override
    public int f1(String str) {
        char[] digits;
        int countWord=0, countDigits=0;
        String[] words = str.split(" ");
        for (int i=0; i<words.length; i++){
            digits = words[i].toCharArray();
            for (int j=0; j<digits.length; j++){
                if (Character.isDigit(digits[j])){
                    if(Integer.parseInt(String.valueOf(digits[j]))%2 ==1){
                        countDigits ++;
                    }
                }
            }
            if (countDigits >=2) countWord++;
        }
        return countWord;
    }

    @Override
    public String f2(String str) {
        int maxLength=0, minIndex=0, minLength=1000;
        String[] words = str.split(" ");
        for (int i=0; i<words.length; i++){
            if(maxLength < words[i].length()){
                maxLength = words[i].length();
            }
            if(minLength > words[i].length()){
                minLength = words[i].length();
                minIndex = i;
            }
        }
        words[minIndex] = Integer.toString(maxLength);
        String result = "";
        for (int i=0; i<words.length; i++){
            result = result + " " + words[i] ;
        }
    return result.trim();
    }
}
