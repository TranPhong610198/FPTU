import java.util.*;
class Person{
    String name; int age;
    Person(String n, int a){
        name =n;
        age =a;
    }
    public void print(){
        System.out.println(name +", "+age);
    }
}
public class Generics2{
    public static void main (String[] args){
        Person temp ;
        Vector v = new Vector();
        v.add (new Person ("Hoa", 23));
        v.add (new Person ("Tuấn", 27));
        for (int i=v.size()-1; i>=0; i--){
            temp = (Person) v.get(i);
            temp.print();
        }
    }
}