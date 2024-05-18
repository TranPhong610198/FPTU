
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        MyQueue xQ = new MyQueue();
        
        xQ.enqueue(1);
        xQ.enqueue(2);
        xQ.enqueue(3);
        xQ.enqueue(4);
        xQ.traverse();
        
        xQ.dequeue();
        xQ.traverse();
        
        xQ.front();
        xQ.traverse();
    }
    
}
