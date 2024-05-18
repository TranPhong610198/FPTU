
import java.util.List;


public class MyWall implements IWall{

    @Override
    public int f1(List<Wall> t) {
        int index =0;
        int minArea=10000;
        List<Wall> tempLi;
        for (int i=0; i<t.size(); i++){
            if (t.get(i).getPlace().length() % Math.sqrt((double) t.get(i).getPlace().length()) == 0 && Math.sqrt((double) t.get(i).getPlace().length())>1){
                if(t.get(i).area < minArea){
                    index = i;
                    minArea = t.get(i).area;
                }
            }
        }
        return t.get(index).area;
    }

    @Override
    public void f2(List<Wall> t) {
        int n =6;
        Wall temp = new Wall();
            temp = t.get(3);
            t.set(3, t.get(5));
            t.set(5, temp);
    }

    @Override
    public void f3(List<Wall> t) {
        int index =0;
        for (int i=0; i<t.size(); i++){
            if (t.get(i).getArea() < t.get(index).getArea()){
                index = i;
            }
        }
        t.set(0, t.get(index));
    }
    
}
