/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package q1_linkedlist;

/**
 *
 * @author tphon
 */
public class MyList {

    Node head, tail;

    MyList() {
        head = tail = null;
    }

    public boolean isEmpty() {
        return (head == null);
    }

    public void add(int x) {
        if (isEmpty()) {
            head = tail = new Node(x, null);
        } else {
            Node q = new Node(x, null);
            tail.next = q;
            tail = q;
        }
    }

//1    
    public void addToHead(int value) {
        if (!isEmpty()) {
            head = new Node(value, head);
        } else {
            head = tail = new Node(value, null);
        }
    }

//2
    public void addToTail(int value) {
        if (isEmpty()) {
            head = tail = new Node(value, null);
        } else {
            Node q = new Node(value, null);
            tail.next = q;
            tail = q;
        }
    }

//3 
    public void addAfter(Node p, int x) {
        if (p == null) {
            System.out.println("Node p can't be null");
            return;
        }
        if (isEmpty()) {
            head = tail = new Node(x, null);
        } else {
            p.next = new Node(x, p.next);
        }
    }

//4
    public void traverse() {
        Node p = head;
        if (isEmpty()) {
            System.out.println("List is empty");
        }
        while (p != null) {
            System.out.print(" " + p.value);
            p = p.next;
        }
        System.out.println();
    }

//5    
    public int deleteFromHead() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        } else {
            int result = head.value;
            head = head.next;
            return result;
        }
    }

//6    
    public int deleteFromTail() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        } else if (head == tail) {
            head = tail = null;
            return -1;
        } else {
            int result = tail.value;
            Node p = head;
            while (p.next != tail) {
                p = p.next;
            }
            tail = p;
            p.next = null;
            return result;
        }
    }

//7    
    public int deleteAfter(Node p) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        }
        if (p == null) {
            System.out.println("Node can't be null");
            return -1;
        } else if (head == tail) {
            System.out.println("Nothing after this node");
            return -1;
        } else {
            int result = p.next.value;
            p.next = p.next.next;
            return result;
        }
    }

//9    
    public Node search(int x) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return null;
        } else {
            Node temp = head;
            while (temp != null) {
                if (temp.value == x) {
                    return temp;
                } else {
                    temp = temp.next;
                }
            }
        }
        return null;
    }

//8   
    public void deleValue(int value) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return;
        }
        if (head.value == value) {
            deleteFromHead();
        } else {
//            boolean checkNode = false;
            Node curDelNode = head;
            Node delNode = curDelNode.next;
            while (delNode != null) {
                if (delNode.value == value) {
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

//10   
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

//11    
    public void deleIndex(int index) {
        int size = count() - 1;
        if (isEmpty()) {
            System.out.println("List is empty");
        } else if (index > size) {
            System.out.println("This Node is not exist");
        } else if (index == 0) {
            deleteFromHead();
        } else {
            Node temp = head;
            int count = 0;

            while (count < index - 1) {
                temp = temp.next;
                ++count;
            }

            temp.next = temp.next.next;
        }
    }

//12    
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

    public void sort() {
        if (isEmpty()) {
            System.out.println("List is empty");
        } else {
            boolean swap = false;
            for (int i = 0; i < count() - 1; i++) {
                for (int j = 0; j < count() - 1; j++) {
                    if (searchIndex(j).value > searchIndex(j + 1).value) {
                        int temp = searchIndex(j).value;
                        searchIndex(j).value = searchIndex(j + 1).value;
                        searchIndex(j + 1).value = temp;
                        swap = true;
                    }
                }
                if (!swap) {
                    return;
                }
            }
        }
    }

//13    
    public int searchNode(Node p) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        }
        Node temp = head;
        int tempIndex = 0;
        while (temp != null) {
            if (temp == p) {
                return tempIndex;
            } else {
                temp = temp.next;
                tempIndex++;
            }
        }
        System.out.println("Node p not exist in List");
        return -1;
    }

    public void dele(Node p) {
        if (isEmpty()) {
            System.out.println("List is empty");
            return;
        }
        if (searchNode(p) != -1) {
            deleIndex(searchNode(p));
        }
    }

//14
    public int[] toArray() {
        int[] tempArr = new int[count()];
        Node tempNode = head;
        int index = 0;
        while (tempNode != null) {
            tempArr[index++] = tempNode.value;
            tempNode = tempNode.next;
        }
        return tempArr;
    }

//15
    public MyList mergeList(MyList list2) {
        if (isEmpty() || list2.isEmpty()) {
            System.out.println("List is empty");
        } else {
            int index1 = 0;
            int index2 = 0;
            MyList result = new MyList();
            while (index1 < count() || index2 < list2.count()) {
                if (index1 == count() && (list2.count() > index2)) {
                    result.addToTail(list2.searchIndex(index2).value);
                    index2++;
                } else if (index1 < count() && (list2.count() == index2)) {
                    result.addToTail(searchIndex(index1).value);
                    index1++;
                } else if (searchIndex(index1).value < list2.searchIndex(index2).value) {
                    result.addToTail(searchIndex(index1).value);
                    index1++;
                } else {
                    result.addToTail(list2.searchIndex(index2).value);
                    index2++;
                }
            }
            return result;
        }
        return null;
    }

//16
    public void addBefore(Node p, int value) {
        if (isEmpty()) {
            head = tail = new Node(value, null);
        } else if (p == null) {
            System.out.println("Node is not exist in list");
        } else if (searchNode(p) == -1) {
            System.out.println("Node is not exist in list");
        } else if (head == p) {
            addToHead(value);
        } else {
            Node curTemp = head;
            Node temp = curTemp.next;
            while (temp != p && temp != null) {
                temp = temp.next;
                curTemp = curTemp.next;
            }
            addAfter(curTemp, value);
        }
    }

//17
    public void Attach(MyList list) {
        if (isEmpty() || list.isEmpty()) {
            System.out.println("List is empty");
        } else {
            int index = 0;
            while (index < list.count()) {
                addToTail(list.searchIndex(index).value);
                index++;
            }
        }
    }
//18

    public int max() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        } else {
            Node temp = head;
            int max = head.value;
            while (temp != null) {
                if (max < temp.value) {
                    max = temp.value;
                }
                temp = temp.next;
            }
            return max;
        }
    }

//19    
    public int min() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        } else {
            Node temp = head;
            int min = head.value;
            while (temp != null) {
                if (min > temp.value) {
                    min = temp.value;
                }
                temp = temp.next;
            }
            return min;
        }
    }

//20    
    public int sum() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        } else {
            Node temp = head;
            int sum = 0;
            while (temp != null) {
                sum += temp.value;
                temp = temp.next;
            }
            return sum;
        }
    }

//21    
    public int avg() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return -1;
        } else {
            int avg = sum() / count();
            return avg;
        }
    }

//22
    public boolean sorted() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return false;
        } else {
            Node temp = head;
            while (temp != tail) {
                if (temp.value > temp.next.value) return false;
                temp = temp.next;
            }
            return true;
        }
    }
    
//23
    public void insert(int x){
        if (isEmpty()){
            System.out.println("List is Empty");
            return;
        }
        if (!sorted()){
            sort();
        }
        else {
            Node temp = head;
            while ((temp.value<x) && (temp.next != null)){
                temp = temp.next;
            }
            addBefore(temp, x);
        }
    }
    
//24
    public MyList reverseList(){
        MyList result = new MyList();
        int[] arr = new int[count()];
        arr = toArray();
        for (int i=arr.length-1; i>=0; i--){
            result.addToTail(arr[i]);
        }
        return result;
    }
    
//25
    public boolean compare(MyList list1, MyList list2){
        if (list1.count() != list2.count()) return false;
        else {
            Node temp1 = list1.head;
            Node temp2 = list2.head;
            while (temp1 !=null){
                if (temp1.value!=temp2.value)
                    return false;
                else{
                    temp1 = temp1.next;
                    temp2 = temp2.next;
                }    
            }
            return true;
        }
    }
}
