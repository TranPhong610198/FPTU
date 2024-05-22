package q2_queue;


class MyQueue {

    protected Node head, tail;

    public MyQueue() {
        head = tail = null;
    }

    public boolean isEmpty() {
        return head == null;
    }

    public void clear() {
        head = tail = null;
    }

//3. void enqueue(int x)
    void enqueue(Object x) {
        Node newNode = new Node(x);
        if (isEmpty()) {
            head = tail = newNode;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
    }

//4. int dequeue() 
    public Object dequeue() throws Exception {
        if (isEmpty()) {
            throw new Exception();
        }
        Object x = head.info;
        head = head.next;
        if (head == null) {
            tail = null;
        }
        return x;
    }

//5. int first()
    Object front() throws Exception {
        if (isEmpty()) {
            throw new Exception();
        }
        Object x = head.info;
        return x;
    }

//6. void traverse()
    void traverse() {
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return;
        }
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.info + " ");
            temp = temp.next;
        }
        System.out.println();
    }

//7. convert a real number < 1  in decimal => binary 
    void convertToBinary(double decimalNum) {
        MyQueue binaryQueue = new MyQueue();
        while (decimalNum > 0) {
            if (decimalNum >= 1) {
                binaryQueue.enqueue(1);
                decimalNum -= 1;
            } else {
                binaryQueue.enqueue(0);
                decimalNum *= 2;
            }
        }
        System.out.print("Binary representation: ");
        binaryQueue.traverse();
    }
}