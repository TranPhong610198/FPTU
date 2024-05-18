
class MyList {

    Node head;

    MyList() {
        head = null;
    }

    boolean isEmpty() {
        return head == null;
    }

    void clear() {
        head = null;
    }

    // 1. void addToHead(String x)
    void addToHead(String x) {
        Node newNode = new Node(x);
        newNode.next = head;
        head = newNode;
    }

    // 2. void addToTail(String x)
    void addToTail(String x) {
        Node newNode = new Node(x);
        if (isEmpty()) {
            head = newNode;
            return;
        }
        Node temp = head;
        while (temp.next != null) {
            temp = temp.next;
        }
        temp.next = newNode;
    }

    // 3. void addAfter(Node p, String x)
    void addAfter(Node p, String x) {
        if (p == null) {
            System.out.println("Node P null");
            return;
        }
        Node newNode = new Node(x);
        newNode.next = p.next;
        p.next = newNode;
    }

    // 4. void traverse()
    void traverse() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.info + " ");
            temp = temp.next;
        }
        System.out.println();
    }

    // 5. String deleteFromHead()
    String deleteFromHead() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return null;
        }
        String temp = head.info;
        head = head.next;
        return temp;
    }

    // 6.  String deleteFromTail()
    String deleteFromTail() {
        if (isEmpty()) {
            System.out.println("List is empty");
            return null;
        }
        if (head.next == null) {
            String temp = head.info;
            head = null;
            return temp;
        }
        Node temp = head;
        while (temp.next.next != null) {
            temp = temp.next;
        }
        String data = temp.next.info;
        temp.next = null;
        return data;
    }

    // 7. String deleteAfter(Node p)
    String deleteAfter(Node p) {
        if (p == null || p.next == null) {
            System.out.println("Node P cannot be null or last node");
            return null;
        }
        String temp = p.next.info;
        p.next = p.next.next;
        return temp;
    }

    // 8. void delete(String x)
    void delete(String x) {
        if (head == null) {
            System.out.println("List is empty");
            return;
        }
        if (head.info.equals(x)) {
            head = head.next;
            return;
        }
        Node temp = head;
        while (temp.next != null) {
            if (temp.next.info.equals(x)) {
                temp.next = temp.next.next;
                return;
            }
            temp = temp.next;
        }
        System.out.println("Node with value " + x + " not found");
    }

    // 9. Node search(String x)
    Node search(String x) {
        Node temp = head;
        while (temp != null) {
            if (temp.info.equals(x)) {
                return temp;
            }
            temp = temp.next;
        }
        return null;
    }

    // 10. int count()
    int count() {
        int count = 0;
        Node temp = head;
        while (temp != null) {
            count++;
            temp = temp.next;
        }
        return count;
    }
}
