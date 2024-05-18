
public class MyList {
    Node head, tail;
    MyList(){
        head = tail = null;
    }
    
    boolean isEmpty(){
        return(head == null);
    }
  
    void clear(){
        head = tail = null;
    }
    
    void add(int x){
        if (isEmpty())
            head = tail = new Node(x,null);
        else{
            Node q = new Node(x, null);
            tail.next = q; tail = q;
        }
    }
    
    void traverse(){
        Node p = head;
        while (p!=null){
            System.out.print(" " + p.info);
            p=p.next;
        }
        System.out.println();
    }
    
//    Node search(int x){}
//    void dele(int x) {}
}

