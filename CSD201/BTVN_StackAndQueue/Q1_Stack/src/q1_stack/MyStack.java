package q1_stack;


import java.util.*;

public class MyStack {

    Node head;

    MyStack() {
        head = null;
    }

    boolean isEmpty() {
        return head == null;
    }

    void clear() {
        head = null;
    }
    
//3.   void push(int x)
    void push(int x) {
        Node newNode = new Node(x);
        newNode.next = head;
        head = newNode;
    }

 //4.   int pop()   
    public Object pop() throws EmptyStackException {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        Object x = head.info;
        head = head.next;
        return (x);
    }

//5.   int top()    
    Object top() throws EmptyStackException {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return head.info;
    }

//6.   void traverse()
    void traverse() {
        if (isEmpty()) {
            System.out.println("Stack is empty");
            return;
        }
        Node current = head;
        while (current != null) {
            System.out.print(current.info + " ");
            current = current.next;
        }
        System.out.println();
    }

    void convertToBinary(int decimal) {
        MyStack binary = new MyStack();
        while (decimal > 0) {
            binary.push(decimal % 2);
            decimal /= 2;
        }
        binary.traverse();
    }
}
