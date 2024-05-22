package q1_stack;


public class Main {
     public static void main(String[] args) {
        MyStack stack = new MyStack();  
        System.out.println("Is stack empty? " + stack.isEmpty()); //if isEmpty => true
        stack.clear();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        System.out.println("Stack: ");
        stack.traverse();

        System.out.println("4. Popped element: " + stack.pop());
        System.out.print("Stack after pop: ");
        stack.traverse();

        System.out.println("5. Top element: " + stack.top());
        
        stack.traverse();
        System.out.println("Converting 42 to binary: ");
        stack.convertToBinary(42);
    }
}
