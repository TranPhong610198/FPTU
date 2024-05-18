import java.util.*;

class MyStack
  {  Node head;

    public MyStack() 
      { head = null; }

    public boolean isEmpty()
      { return(head==null);}

    void visit(Node p) {if(p!=null) System.out.print(p.info + " ");}
    void traverse()
     {Node p=head;
       while(p!=null)
         {visit(p);
           p=p.next;
         }
      System.out.println();
     }
    
    public void push(Object x)
      { head = new Node(x,head);
      }
    
    Object top() throws EmptyStackException
      { if(isEmpty()) throw new EmptyStackException();
        return(head.info);
      }
    

    public Object pop() throws EmptyStackException
      { if(isEmpty()) throw new EmptyStackException();
        Object x = head.info;
        head=head.next;
         return(x);
      }

}
