package q2_queue;


public class Main {
    public static void main(String[] args) throws Exception {
        MyQueue queue = new MyQueue();
        System.out.println("Is queue empty? " + queue.isEmpty());
        queue.clear();
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        queue.enqueue(40);

        System.out.print("3. Queue elements before enqueue: ");
        queue.traverse();
       
        System.out.println("4. Dequeued element: " + queue.dequeue());
        
        System.out.println("5. First element: " + queue.front());

        queue.convertToBinary(0.625);
    }
}