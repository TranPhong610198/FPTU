/* This program contains 2 parts: (1) and (2)
   YOUR TASK IS TO COMPLETE THE PART  (2)  ONLY
 */
//(1)==============================================================
import java.util.*;
import java.io.*;

class MyList {

    Node head, tail;

    MyList() {
        head = tail = null;
    }

    boolean isEmpty() {
        return (head == null);
    }

    void clear() {
        head = tail = null;
    }

    void fvisit(Node p, RandomAccessFile f) throws Exception {
        if (p != null) {
            f.writeBytes(p.info + " ");
        }
    }

    void ftraverse(RandomAccessFile f) throws Exception {
        Node p = head;
        while (p != null) {
            fvisit(p, f); // You will use this statement to write information of the node p to the file
            p = p.next;
        }
        f.writeBytes("\r\n");
    }

    void addLast(Book x) {//You should write here appropriate statements to complete this function.
        Node q = new Node(x);
        if (isEmpty()) {
            head = tail = q;
        } else {
            tail.next = q;
            tail = q;
        }
    }

    void addLast(String xName, int xPrice) {//You should write here appropriate statements to complete this function.
        if (xName.charAt(0) == 'D' || xPrice < 15000) {
            return;
        }
        Book x = new Book(xName, xPrice);
        addLast(x);

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
        int n = 0;
        Node tmp = head;
        while (tmp != null) {
            n++;
            tmp = tmp.next;
        }
        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                Node pi = get(i), pj = get(j);

                int check = pi.info.name.compareTo(pj.info.name);
                if (check < 0) {
                    Book t = pi.info;
                    pi.info = pj.info;
                    pj.info = t;
                }
            }
        }
    }

    void loadData(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k);
        int[] b = Lib.readLineToIntArray("data.txt", k + 1);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            addLast(a[i], b[i]);
        }
    }

//===========================================================================
//(2)===YOU CAN EDIT OR EVEN ADD NEW FUNCTIONS IN THE FOLLOWING PART========
//===========================================================================
    void f1() throws Exception {/* You do not need to edit this function. Your task is to complete the addLast  function
        above only.
         */
        clear();
        loadData(1);
        String fname = "f1.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        ftraverse(f);
        f.close();
    }

//==================================================================
    void f2() throws Exception {
        clear();
        loadData(4);
        String fname = "f2.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        ftraverse(f);
        Book x = new Book("X", 10000);
        //------------------------------------------------------------------------------------
        /*You must keep statements pre-given in this function.
       Your task is to insert statements here, just after this comment,
       to complete the question in the exam paper.*/

        //------------------------------------------------------------------------------------
        Node temp = new Node(x, head);
        head = temp;

        ftraverse(f);
        f.close();
    }

//==================================================================
    public void deleValue(int value) {

        boolean checkNode = false;
        Node curDelNode = head;
        while (curDelNode.next != null) {
            if (curDelNode.next.info.price == value) {
                curDelNode.next = curDelNode.next.next;
                checkNode = true;
            } else {
                curDelNode = curDelNode.next;
            }
        }
        if (!checkNode) {
            System.out.println(value + " isn't exist in List");
        }
    }

    void f3() throws Exception {
        clear();
        loadData(7);
        String fname = "f3.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        ftraverse(f);
        //------------------------------------------------------------------------------------
        /*You must keep statements pre-given in this function.
       Your task is to insert statements here, just after this comment,
       to complete the question in the exam paper.*/

        //------------------------------------------------------------------------------------
        deleValue(50000);
        ftraverse(f);
        f.close();
    }

//==================================================================

//Quick Sort
Node getTail(Node cur) {
    while (cur != null && cur.next != null)
        cur = cur.next;
    return cur;
}

Node partition(Node start, Node end) {
    if (start == end || start == null || end == null)
        return start;

    Node pivot_prev = start;
    Node curr = start;
    Book pivot = end.info;

    while (start != end) {
        if (start.info.name.compareTo(pivot.name) > 0) { // Change to > for descending order
            pivot_prev = curr;
            Book temp = curr.info;
            curr.info = start.info;
            start.info = temp;
            curr = curr.next;
        }
        start = start.next;
    }

    Book temp = curr.info;
    curr.info = end.info;
    end.info = temp;

    return pivot_prev;
}

void quickSort(Node head, Node end) {
    if (head == null || head == end || head == end.next)
        return;

    Node pivot_prev = partition(head, end);
    quickSort(head, pivot_prev);

    if (pivot_prev != null && pivot_prev == head)
        quickSort(pivot_prev.next, end);
    else if (pivot_prev != null && pivot_prev.next != null)
        quickSort(pivot_prev.next.next, end);
}

void qSort() {
    Node end = getTail(head);
    quickSort(head, end);
}

//Insertion Sort
   public void InsertionSort() {
       if (head == null || head.next == null) {
           return;
       }

       Node sorted = null;
       Node current = head;

       while (current != null) {
           Node next = current.next;

           if (sorted == null || sorted.info.name.compareTo(current.info.name) < 0) {
               current.next = sorted;
               sorted = current;
           } else {
               Node temp = sorted;
               while (temp.next != null && temp.next.info.name.compareTo(current.info.name) >= 0) {
                   temp = temp.next;
               }
               current.next = temp.next;
               temp.next = current;
           }

           current = next;
       }

       head = sorted;
   }
void f4() throws Exception {
    clear();
    loadData(10);
    String fname = "f4.txt";
    File g123 = new File(fname);
    if (g123.exists()) {
        g123.delete();
    }
    RandomAccessFile f = new RandomAccessFile(fname, "rw");
    ftraverse(f);
    //------------------------------------------------------------------------------------
    /*You must keep statements pre-given in this function.
   Your task is to insert statements here, just after this comment,
   to complete the question in the exam paper.*/
    qSort();
    // InsertionSort();
    //------------------------------------------------------------------------------------
    ftraverse(f);
    f.close();
}

}
