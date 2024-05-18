import java.util.*;
public class MyCar implements ICar { 
    @Override
    public int f1(List<Car> t){
        double sum=0;
        int count =0;
        for (Car x: t){
            sum += x.getRate();
            count ++;
        }
        return (int) sum/count;
    }
    
    @Override
    public void f2(List<Car> t){
        int MAX = 0, MIN = 10000, iMAX = 0, iMIN = 0;
        int i, n=t.size();
        Car x, y;
        
        for(i=0; i<n; i++){
            x= t.get(i);
            if (MAX < x.getRate()){
                MAX = x.getRate();
                iMAX = i;
            }
        }
        for(i=0; i<n; i++){    
            y = t.get(i);
            if (MIN > y.getRate()){
                MIN = y.getRate();
                iMIN = i;
            }
        }
        x = t.get(iMAX);
        y = t.get(iMIN);
        t.set(iMAX, y);
        t.set(iMIN, x);   
    }

    @Override
    public void f3(List<Car> t) {
        int i, j, n=t.size(), check;
        Car x, y;

        for (i=0; i<n-1; i++){
            for (j = i+1; j<n; j++){
                x = t.get(i);
                y = t.get(j);
                check  = x.getMaker().compareTo(y.getMaker());
                if (check!= 0){
                    if (check > 0){
                        t.set(i, y);
                        t.set(j, x);
                    }
                }
                else{
                    if (x.getRate() < y.getRate()){
                        t.set(i, y);
                        t.set(j, x);
                    }
                }
            }
        }
    }
}
