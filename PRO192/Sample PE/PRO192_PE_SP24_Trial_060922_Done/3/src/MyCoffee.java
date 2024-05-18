
import java.util.List;


public class MyCoffee implements ICoffee {
    
    public boolean checkDigits(String str){
        int test1=0, test2=0;
        char[] temp = str.toCharArray();
        for (int i=0; i<temp.length; i++){
            if(temp[i] == 'A') test1=1;
            if(temp[i] == 'B')  test2= 1;
        }
        
        if (test2 ==1 && test1==1) return true;
        return false;
    }
    
    @Override
    public int f1(List<Coffee> t) {
        int count = 0;
        for(Coffee x: t){
            String test = x.getName();
            if (!checkDigits(test)) count++;
        }
        return count;
    }

    @Override
    public void f2(List<Coffee> t) {
        int Max = 0, index = 0;
        for (int i=0;i<t.size();i++){
            Coffee x = t.get(i);
            if (x.getSize()>Max){
                Max = x.getSize();
                index = i;
            }
        }
        t.remove(index);
    }

    @Override
    public void f3(List<Coffee> t) {
        int index = 0;
        for (int i=0;i<2;i++){
            Coffee x = t.get(i);
            Coffee y = t.get(i+1);
            
            if (x.getSize()%10 < y.getSize()%10) {
                t.set(i, y);
                t.set(i+1, x);
            }
        }
    }
    
}
