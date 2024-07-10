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
    void addLast(String xOwner, int xPrice) {//You should write here appropriate statements to complete this function.
        if (xOwner.charAt(0) == 'B' || xPrice > 100) {
            return;
        } else {
            Car temp = new Car(xOwner, xPrice);
            if (isEmpty()) {
                head = tail = new Node(temp, null);
            } else {
                Node tempNode = new Node(temp);
                tail.next = tempNode;
                tail = tempNode;
            }
        }
    }

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
        Car x = new Car("X", 1);
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

    public void deleteFromHead() {
        if (isEmpty()) {
        } else {
            head = head.next;
        }
    }

    public void deleValue(int value) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return;
        }
        if (head.info.price == value) {
            deleteFromHead();
        } else {
//            boolean checkNode = false;
            Node curDelNode = head;
            Node delNode = curDelNode.next;
            while (delNode != null) {
                if (delNode.info.price == value) {
                    curDelNode.next = curDelNode.next.next;
//                    checkNode = true;
                    return;
                } else {
                    delNode = delNode.next;
                    curDelNode = curDelNode.next;
                }
            }
//            if (!checkNode) System.out.println(value+ " isn't exist in List");
        }
    }

//==================================================================
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
        deleValue(5);

        ftraverse(f);
        f.close();
    }

    public Node searchIndex(int index) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return null;
        } else {
            int tempIndex = 0;
            Node tempNode = head;
            while (tempNode != null) {
                if (tempIndex == index) {
                    return tempNode;
                } else {
                    tempIndex++;
                    tempNode = tempNode.next;
                }
            }
        }
        return null;
    }

    public int count() {
        if (isEmpty()) {
            return 0;
        } else {
            int count = 0;
            Node temp = head;
            while (temp != null) {
                temp = temp.next;
                ++count;
            }
            return count;
        }
    }

    public void sort() {
        if (isEmpty()) {
            System.out.println("List is empty");
        } else {
            boolean swap = false;
            for (int i = 0; i < count() - 1; i++) {
                for (int j = 0; j < count() - 1; j++) {
                    if (searchIndex(j).info.price > searchIndex(j + 1).info.price) {
                        Car temp = searchIndex(j).info;
                        searchIndex(j).info = searchIndex(j + 1).info;
                        searchIndex(j + 1).info = temp;
                        swap = true;
                    }
                }
                if (!swap) {
                    return;
                }
            }
        }
    }

//==================================================================
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

        //------------------------------------------------------------------------------------
        sort();
        
        ftraverse(f);
        f.close();
    }

}
