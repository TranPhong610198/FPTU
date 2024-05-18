import java.util.*;
public class CollectionDemo {
    public static void main(String[] args){
        ArrayList arr = new ArrayList();
        Vector v = new Vector();
        Random rd = new Random();
        for (int i=1; i<11; i++){
            arr.add(rd.nextInt(30));
            v.add(rd.nextInt(30));
        }
        System.out.println("ar="+ arr);
        System.out.println("v="+ v);
        boolean dis = Collections.disjoint(arr, v);
        System.out.println("ar and v are disjunct: "+ dis);
        Collections.addAll(v, arr.toArray());
        System.out.println("After adding, v=" + v);
        int minVal  = (int) Collections.min(v);
        int maxVal = (int) Collections.max(v);

        System.out.println("min= "+ minVal + ", max= "+ maxVal);
        int fre = Collections.frequency(v, 8);
        System.out.println("Occurences of 8: "+fre);
        Collections.sort(v);
        System.out.println("After sorting, v="+v);;
        int pos = Collections.binarySearch(v, 8);
        System.out.println("Position of 8: "+pos);
        Collections.shuffle(v);
        System.out.println("After shuffling, v="+v);
    }
}
