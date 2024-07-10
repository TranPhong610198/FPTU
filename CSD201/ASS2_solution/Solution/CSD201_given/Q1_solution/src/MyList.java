/* This program contains 2 parts: (1) and (2)
   YOUR TASK IS TO COMPLETE THE PART  (2)  ONLY
 */
//(1)==============================================================
import java.util.*;
import java.io.*;
class MyList
 {Node head,tail;
  MyList() {head=tail=null;}
  boolean isEmpty()
   {return(head==null);
   }
  void clear() {head=tail=null;}

  void fvisit(Node p, RandomAccessFile f) throws Exception
   {if(p != null) f.writeBytes(p.info + " ");
   }

  void ftraverse(RandomAccessFile f) throws Exception
   {Node p = head;
    while(p!=null)
      {fvisit(p,f); // You will use this statement to write information of the node p to the file
       p=p.next;
      }
    f.writeBytes("\r\n");
   }

  void loadData(int k)  //do not edit this function
   {String [] a = Lib.readLineToStrArray("data.txt", k);
    int [] b = Lib.readLineToIntArray("data.txt", k+1);
    int n = a.length;
    for(int i=0;i<n;i++) addLast(a[i],b[i]);
   }

//===========================================================================
//(2)===YOU CAN EDIT OR EVEN ADD NEW FUNCTIONS IN THE FOLLOWING PART========
//===========================================================================
  void addLast(Book x)
   {//You should write here appropriate statements to complete this function.
    Node q = new Node(x);
    if(isEmpty())
     head=tail=q;
     else
     {tail.next=q;
      tail=q;
     }
   }
  void addLast(String xName, int xPrice)
   {//You should write here appropriate statements to complete this function.
       if (xName.charAt(0)=='D' || xPrice < 15000) return;
       Book x = new Book(xName, xPrice);
       addLast(x);

   }
  
    void addFirst(Book x)
   {//You should write here appropriate statements to complete this function.
    Node q = new Node(x,head);
    if(isEmpty())
     head=tail=q;
     else
      head = q;
   }
    
    void dele(Node q)
   {Node f,p;
    f=null;p=head;
    while(p!=null)
     {if(p==q) break;
      f=p;p=p.next;
     }
    if(p==null) return;//q is not found
    if(f==null)
     {head=head.next;
      if(head==null) tail=null;
      return;
     }
    f.next=p.next;
    if(f.next==null) tail=f;
   }
 void dele(int xPrice)
   {int j=0;Node p=head;
    while(p!=null)
     {if(p.info.price==xPrice)
      dele(p);
         p=p.next;
     }
    
   }
 
  public Node get(int k) {
        Node p = head;
        int c = 0;
        while (p != null && c < k) {
            c++;
            p = p.next; 
        }
        return p;
    }
  
  public void sort() {
       int n=0;
       Node tmp=head;
       while(tmp!=null){
           n++;
           tmp=tmp.next;
       }
        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                Node pi = get(i), pj = get(j);
                
                int check=pi.info.name.compareTo(pj.info.name);
                if (check<0) {
                    Book t = pi.info;
                    pi.info = pj.info;
                    pj.info = t;
                }
            }
        }
    }
 

  void f1() throws Exception
    {/* You do not need to edit this function. Your task is to complete the addLast  function
        above only.
     */
     clear();
     loadData(1);
     String fname = "f1.txt";
     File g123 = new File(fname);
     if(g123.exists()) g123.delete();
     RandomAccessFile  f = new RandomAccessFile(fname, "rw"); 
     ftraverse(f);
     f.close();
    }  

//==================================================================
  void f2() throws Exception
    {clear();
     loadData(4);
     String fname = "f2.txt";
     File g123 = new File(fname);
     if(g123.exists()) g123.delete();
     RandomAccessFile  f = new RandomAccessFile(fname, "rw"); 
     ftraverse(f);
     Book x = new Book("X",10000);
     //------------------------------------------------------------------------------------
     addFirst(x);
     /*You must keep statements pre-given in this function.
       Your task is to insert statements here, just after this comment,
       to complete the question in the exam paper.*/



    //------------------------------------------------------------------------------------
     ftraverse(f);
     f.close();
    }  

//==================================================================
  void f3() throws Exception
   {clear();
    loadData(7);
    String fname = "f3.txt";
    File g123 = new File(fname);
    if(g123.exists()) g123.delete();
    RandomAccessFile  f = new RandomAccessFile(fname, "rw"); 
    ftraverse(f);
    //------------------------------------------------------------------------------------
     /*You must keep statements pre-given in this function.
       Your task is to insert statements here, just after this comment,
       to complete the question in the exam paper.*/


    dele(50000);
    //------------------------------------------------------------------------------------
    ftraverse(f);
    f.close();
   }

//==================================================================
  void f4() throws Exception
   {clear();
    loadData(10);
    String fname = "f4.txt";
    File g123 = new File(fname);
    if(g123.exists()) g123.delete();
    RandomAccessFile  f = new RandomAccessFile(fname, "rw"); 
    ftraverse(f);
    //------------------------------------------------------------------------------------
     /*You must keep statements pre-given in this function.
       Your task is to insert statements here, just after this comment,
       to complete the question in the exam paper.*/

    sort();

    //------------------------------------------------------------------------------------
    ftraverse(f);
    f.close();
   }

 }
