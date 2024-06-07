package bst;

// Lớp Node đại diện cho một nút trong cây nhị phân
public class Node {
    int value; // Giá trị của nút
    Node left, right; // Con trỏ tới các nút con bên trái và bên phải

    // Constructor để khởi tạo một nút mới
    public Node(int value) {
        this.value = value;
        left = right = null;
    }
}
