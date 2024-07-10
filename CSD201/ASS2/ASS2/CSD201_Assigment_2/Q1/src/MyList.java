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

    public int partition(int l, int r, String key) {
        int iL = l;
        int iR = r;
        while (iL <= iR) {
            Node nL = get(iL);
            Node nR = get(iR);
            while (nL.info.name.compareTo(key) < 0) {
                iL++;
            }
            while (nL.info.name.compareTo(key) > 0) {
                iR--;
            }

            if (iL <= iR) {
                Book t = nL.info;
                nL.info = nR.info;
                nR.info = t;
                iL++;
                iR--;
            }
        }
        return iL;
    }

    public void quickSort(int l, int r) {
        if (l >= r) {
            return;
        }

        String key = get((l + r) / 2).info.name;
        int k = partition(l, r, key);

        quickSort(l, k - 1);
        quickSort(k, r);
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
//        sort();
        int n = 0;
        Node tmp = head;
        while (tmp != null) {
            n++;
            tmp = tmp.next;
        }
        quickSort(0, n-1);
        //------------------------------------------------------------------------------------
        ftraverse(f);
        f.close();
    }

}
