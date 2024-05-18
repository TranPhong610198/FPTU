 
import java.util.*;

public class MyCar implements ICar { 

    @Override
    public int f1(List<Car> t) {
     int i,n,s; Car x; n = t.size();
     double avg,sum;
     sum = 0;
     for(i=0;i<n;i++) {
       x = t.get(i);
       sum += x.getRate(); 
     }
     avg = sum/n;
     s = (int) avg;
     return(s);   
   }        

    public int maxRate(List<Car> t) {
       int n,i,k; n=t.size();int u; Car x;
       k=0; u = t.get(0).getRate();
       for(i=1;i<n;i++) {
          x=t.get(i);
          if(x.getRate()>u) {
              k=i; u=x.getRate();
          }
       }
       return(k);
    }

    public int minRate(List<Car> t) {
       int n,i,k; n=t.size();int u; Car x;
       k=0; u = t.get(0).getRate();
       for(i=1;i<n;i++) {
          x=t.get(i);
          if(x.getRate()<u) {
              k=i; u=x.getRate();
          }
       }
       return(k);
    }
    @Override
    public void f2(List<Car> t) {
      int k,h; Car x,y;
      k = maxRate(t); 
      h = minRate(t); 
      x = t.get(k);
      y = t.get(h);
      t.set(k,y);
      t.set(h,x);
    }
    
    @Override
    public void f3(List<Car> t) {
      Comparator<Car> u = new Comparator<Car>(){
        public int compare(Car x, Car y) {
           int r = x.getMaker().compareTo(y.getMaker());
           if(r!=0)  return(r);
           if(x.getRate()>y.getRate())
               return(-1);
           else if(x.getRate()==y.getRate())
              return(0);
             else
             return(1);
         }   
       };
      Collections.sort(t,u);
    }
     
}
