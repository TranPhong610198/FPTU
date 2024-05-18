
import java.lang.*;

class A {

    int x, y;

    void display() {
        System.out.print(x + " " + y);
    }
}

public class temp {

    public static void main(String args[]) {
        A obj1 = new A();
        A obj2 = new A();
        obj1.x = 1;
        obj1.y = 2;
        obj2 = (A) obj1.clone();
        obj1.display();
        obj2.display();
    }
}
