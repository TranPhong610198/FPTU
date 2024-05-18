
public class Main {

    public static void Convert(int number){
        
        if (number ==0){System.out.println(0);}
            
        boolean sign = true;
        if (number < 0){
            number = -number;
            sign = false;
            }
        
        MyStack st = new MyStack();
        int remainder;
        while (number > 0){
            remainder = number % 2;
            st.push(remainder); 
            
            number/=2;
        }
        if (!sign) System.out.print('1');
        while (!st.isEmpty()){
        System.out.print(st.pop());}
        System.out.println();
        
        
        
    }
    
    public static void main(String[] args) {
        Convert(-12);

        
    }
    
    
}
