public class Encapsulation_3 {
    public double sum(double... group){
        double S = 0;
        for (double x: group) S+=x;
        return S;
    }
    public String concate(String... group){
        String S = "";
        for (String x: group) S+=x + " ";
        return S;
    }
    public static void main(String[] args){
        Encapsulation_3 obj = new Encapsulation_3();
        double total = obj.sum(5.4, 3.2, 9.08, 4);
        System.out.println(total);
        String line = obj.concate("I", "love", "you", "!");
        System.out.println(line);
    }
}