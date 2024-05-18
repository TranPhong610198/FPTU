class MyQueue
  { protected Q_Node head,tail;

    public MyQueue() 
      { head = tail = null; }

    public boolean isEmpty()
      { return(head==null);}

    Object front() throws Exception
      { if(isEmpty()) throw new Exception();
      Object x = head.info;
      System.out.println(x);  
      return(x);
      }
    
   public Object dequeue() throws Exception
   { if(isEmpty()) throw new Exception();
     Object x = head.info;
     System.out.println(x);
     head=head.next;
     if(head==null) tail=null;
         return(x);
   }

 void enqueue(Object x)
   { if(isEmpty())
     head = tail = new Q_Node(x);
     else
       { tail.next = new Q_Node(x);
         tail = tail.next;
       }
   }
 
 void visit(Q_Node p) {if(p!=null) System.out.print(p.info + " ");}
    void traverse()
     {Q_Node p=head;
       while(p!=null)
         {visit(p);
           p=p.next;
         }
      System.out.println();
     }
}
