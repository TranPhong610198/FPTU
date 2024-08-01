/* This program contains 2 parts: (1) and (2)
 YOUR TASK IS TO COMPLETE THE PART  (2)  ONLY
 */
//(1)==============================================================

import java.io.*;
import java.util.*;

class BSTree {

    Node root;

    BSTree() {
        root = null;
    }

    boolean isEmpty() {
        return (root == null);
    }

    void clear() {
        root = null;
    }

    void fvisit(Node p, RandomAccessFile f) throws Exception {
        if (p != null) {
            f.writeBytes(p.info + " ");
        }
    }

    void preOrder(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }
        fvisit(p, f);
        preOrder(p.left, f);
        preOrder(p.right, f);
    }

    void inOrder(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }
        inOrder(p.left, f);
        fvisit(p, f);
        inOrder(p.right, f);
    }

    void postOrder(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }
        postOrder(p.left, f);
        postOrder(p.right, f);
        fvisit(p, f);
    }

    void breadth(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }
        Queue q = new Queue();
        q.enqueue(p);
        Node r;
        while (!q.isEmpty()) {
            r = q.dequeue();
            fvisit(r, f);
            if (r.left != null) {
                q.enqueue(r.left);
            }
            if (r.right != null) {
                q.enqueue(r.right);
            }
        }
    }

    void loadData(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k);
        int[] b = Lib.readLineToIntArray("data.txt", k + 1);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            insert(a[i], b[i]);
        }
    }

//===========================================================================
//(2)===YOU CAN EDIT OR EVEN ADD NEW FUNCTIONS IN THE FOLLOWING PART========
//===========================================================================
    public void insert(Car x) {
        root = insertRec(root, x);
    }

    public Node insertRec(Node root, Car x) {
        if (root == null) {
            root = new Node(x);
            return root;
        }
        if (x.price < root.info.price) {
            root.left = insertRec(root.left, x);
        } else if (x.price > root.info.price) {
            root.right = insertRec(root.right, x);
        }
        return root;
    }

    void insert(String xOwner, int xPrice) {//You should insert here statements to complete this function
        if (xOwner.charAt(0) == 'A' || xPrice > 100) {
            return;
        } else {
            Car temp = new Car(xOwner, xPrice);
            insert(temp);
        }

    }

    void f1() throws Exception {/* You do not need to edit this function. Your task is to complete insert  function
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
        preOrder(root, f);
        f.writeBytes("\r\n");
        inOrder(root, f);
        f.writeBytes("\r\n");
        f.close();
    }

//=============================================================
    void preOrder2(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }
        if (p.info.price >= 4 && p.info.price <= 7) {
            fvisit(p, f);
//            System.out.println(p.info);
        }
        preOrder2(p.left, f);
        preOrder2(p.right, f);
    }

    void f2() throws Exception {
        clear();
        loadData(4);
        String fname = "f2.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        preOrder(root, f);
        f.writeBytes("\r\n");
        //------------------------------------------------------------------------------------
        /*You must keep statements pre-given in this function.
         Your task is to insert statements here, just after this comment,
         to complete the question in the exam paper.*/

        preOrder2(root, f);

        //------------------------------------------------------------------------------------
        f.writeBytes("\r\n");
        f.close();
    }

// f.writeBytes(" k = " + k + "\r\n");
//=============================================================
    int breadthFind3rdMin(Node p, RandomAccessFile f) throws Exception {
        int min1 = Integer.MAX_VALUE;
        int min2 = Integer.MAX_VALUE;
        int min3 = Integer.MAX_VALUE;
        if (p == null) {
            return -1;
        }
        Queue q = new Queue();
        q.enqueue(p);
        Node r;
        while (!q.isEmpty()) {
            r = q.dequeue();
            if (r.info.price < min1) {
                min2 = min1;
                min1 = r.info.price;
            }
            else if (r.info.price < min2){
                min3 = min2;
                min2 = r.info.price;
            }
            else if (r.info.price < min3){
                min3 = r.info.price;
            }
            if (r.left != null) {
                q.enqueue(r.left);
            }
            if (r.right != null) {
                q.enqueue(r.right);
            }
        }
        return min3;
    }

    void breadthDel(Node p, RandomAccessFile f, int min3) throws Exception {
        if (p == null) {
            return;
        }
        Queue q = new Queue();
        q.enqueue(p);
        Node r;
        while (!q.isEmpty()) {
            r = q.dequeue();
            if (r.info.price == min3) {
                deleteByCopying(r.info.price);
                return;
            }
            if (r.left != null) {
                q.enqueue(r.left);
            }
            if (r.right != null) {
                q.enqueue(r.right);
            }
        }
    }

    Node deleteRec(Node root, int value) {
        if (root == null) // Nếu cây con rỗng, trả về null
        {
            return root;
        }

        if (value < root.info.price) // Nếu giá trị nhỏ hơn giá trị của nút hiện tại, xóa khỏi cây con bên trái
        {
            root.left = deleteRec(root.left, value);
        } else if (value > root.info.price) // Nếu giá trị lớn hơn giá trị của nút hiện tại, xóa khỏi cây con bên phải
        {
            root.right = deleteRec(root.right, value);
        } else { // Nếu giá trị bằng giá trị của nút hiện tại, đây là nút cần xóa
            if (root.left == null) // Nút chỉ có một con hoặc không có con
            {
                return root.right;
            } else if (root.right == null) {
                return root.left;
            }

            root.info.price = minValue(root.right); // Nút có hai con, tìm giá trị nhỏ nhất từ cây con bên phải

            root.right = deleteRec(root.right, root.info.price); // Xóa nút đó đi
        }

        return root; // Trả về nút hiện tại
    }

    // Phương thức để tìm giá trị nhỏ nhất trong cây con
    int minValue(Node root) {
        int minValue = root.info.price;
        while (root.left != null) { // Duyệt đến nút có giá trị nhỏ nhất
            minValue = root.left.info.price;
            root = root.left;
        }
        return minValue;
    }

    void deleteByCopying(int value) {
        root = deleteByCopyingRec(root, value);
    }

    // Phương thức đệ quy để xóa nút bằng cách sao chép
    Node deleteByCopyingRec(Node root, int value) {
        if (root == null) // Nếu cây con rỗng, trả về null
        {
            return root;
        }

        if (value < root.info.price) // Nếu giá trị nhỏ hơn giá trị của nút hiện tại, xóa khỏi cây con bên trái
        {
            root.left = deleteByCopyingRec(root.left, value);
        } else if (value > root.info.price) // Nếu giá trị lớn hơn giá trị của nút hiện tại, xóa khỏi cây con bên phải
        {
            root.right = deleteByCopyingRec(root.right, value);
        } else { // Nếu giá trị bằng giá trị của nút hiện tại, đây là nút cần xóa
//            if (root.left == null) // Nút chỉ có một con hoặc không có con
//                return root.right;
//            if (root.right == null)
//                return root.left;

            Node temp = root.left;
            while (temp.right != null) { // Tìm nút có giá trị lớn nhất trong cây con bên trái
                temp = temp.right;
            }
            root.info = temp.info; // Sao chép giá trị lớn nhất của cây con bên trái vào nút hiện tại
            root.left = deleteRec(root.left, temp.info.price); // Xóa nút có giá trị lớn nhất đó
        }

        return root; // Trả về nút hiện tại
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
        breadth(root, f);
        f.writeBytes("\r\n");
        //------------------------------------------------------------------------------------
        /*You must keep statements pre-given in this function.
         Your task is to insert statements here, just after this comment,
         to complete the question in the exam paper.*/

        breadthDel(root, f);

        //------------------------------------------------------------------------------------
        breadth(root, f);
        f.writeBytes("\r\n");
        f.close();
    }

//=============================================================
    void rotateRight(Node p) {
        Node q = p.left;
        p.left = q.right;
        q.right = p;
        if (p == root) {
            root = q;
        } else {
            Node parent = findParent(root, p);
            if (parent.left == p) {
                parent.left = q;
            } else {
                parent.right = q;
            }
        }
    }

    Node findParent(Node root, Node p) {
        if (root == null || root == p) {
            return null;
        }
        if (root.left == p || root.right == p) {
            return root;
        }
        Node parent = findParent(root.left, p);
        if (parent != null) {
            return parent;
        }
        return findParent(root.right, p);
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
        breadth(root, f);
        f.writeBytes("\r\n");
        //------------------------------------------------------------------------------------
        /*You must keep statements pre-given in this function.
         Your task is to insert statements here, just after this comment,
         to complete the question in the exam paper.*/
        Queue q = new Queue();
        q.enqueue(root);
        Node p = null;
        while (!q.isEmpty()) {
            p = q.dequeue();
            if (p.left != null && p.info.price < 7) {
                rotateRight(p);
                break;
            }
            if (p.left != null) {
                q.enqueue(p.left);
            }
            if (p.right != null) {
                q.enqueue(p.right);
            }
        }

        //------------------------------------------------------------------------------------
        breadth(root, f);
        f.writeBytes("\r\n");
        f.close();
    }

}
