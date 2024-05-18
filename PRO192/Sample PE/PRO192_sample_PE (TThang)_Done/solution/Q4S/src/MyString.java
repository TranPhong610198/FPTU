 

public class MyString implements IString { 

    public boolean isPrime(int n) {
      if(n==1) return(false);
      if(n==2) return(true);
      for(int i=2;i<=Math.sqrt(n);i++)
         if(n%i==0) return(false);
      return(true);
    }
    @Override
    public int f1(String st) {
      int s,i,n,k;char c;
      n = st.length();
      s = 0;
      for(i=0;i<n;i++) {
        c = st.charAt(i);
        if(Character.isDigit(c)) {
          k = Integer.parseInt("" + c);
          if(isPrime(k)) s++;
         }
       }
       return(s);
    }
//==============================================================================    
    public String f2(String st) {
      String [] a = st.split("[ ]+");
      int n,i; n= a.length;
      String s="";
      for(i=n-1;i>=0;i--) {
        s += " " + a[i]; 
      }
      s = s.trim();
      return(s);
    }
    
}
