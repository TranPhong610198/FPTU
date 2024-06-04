package bst;

public class BST {
    Node root; // Gốc của cây

    // Constructor để khởi tạo cây rỗng
    public BST() {
        root = null;
    }

    // Phương thức để chèn một giá trị vào cây BST
    void insert(int value) {
        root = insertRec(root, value);
    }

    // Phương thức đệ quy để chèn một giá trị vào cây con
    Node insertRec(Node root, int value) {
        if (root == null) { // Nếu cây con rỗng, tạo một nút mới và trả về nút đó
            root = new Node(value);
            return root;
        }

        if (value < root.value) // Nếu giá trị nhỏ hơn giá trị của nút hiện tại, chèn vào cây con bên trái
            root.left = insertRec(root.left, value);
        else if (value > root.value) // Nếu giá trị lớn hơn giá trị của nút hiện tại, chèn vào cây con bên phải
            root.right = insertRec(root.right, value);

        return root; // Trả về nút hiện tại
    }

    // Phương thức để tìm kiếm một giá trị trong cây BST
    boolean search(int value) {
        return searchRec(root, value) != null;
    }

    // Phương thức đệ quy để tìm kiếm một giá trị trong cây con
    Node searchRec(Node root, int value) {
        if (root == null || root.value == value) // Nếu nút rỗng hoặc giá trị của nút bằng giá trị cần tìm, trả về nút đó
            return root;

        if (root.value > value) // Nếu giá trị của nút lớn hơn giá trị cần tìm, tìm kiếm trong cây con bên trái
            return searchRec(root.left, value);

        return searchRec(root.right, value); // Nếu không, tìm kiếm trong cây con bên phải
    }

    // Phương thức để xóa một giá trị khỏi cây BST
    void delete(int value) {
        root = deleteRec(root, value);
    }

    // Phương thức đệ quy để xóa một giá trị khỏi cây con
    Node deleteRec(Node root, int value) {
        if (root == null) // Nếu cây con rỗng, trả về null
            return root;

        if (value < root.value) // Nếu giá trị nhỏ hơn giá trị của nút hiện tại, xóa khỏi cây con bên trái
            root.left = deleteRec(root.left, value);
        else if (value > root.value) // Nếu giá trị lớn hơn giá trị của nút hiện tại, xóa khỏi cây con bên phải
            root.right = deleteRec(root.right, value);
        else { // Nếu giá trị bằng giá trị của nút hiện tại, đây là nút cần xóa
            if (root.left == null) // Nút chỉ có một con hoặc không có con
                return root.right;
            else if (root.right == null)
                return root.left;

            root.value = minValue(root.right); // Nút có hai con, tìm giá trị nhỏ nhất từ cây con bên phải

            root.right = deleteRec(root.right, root.value); // Xóa nút đó đi
        }

        return root; // Trả về nút hiện tại
    }

    // Phương thức để tìm giá trị nhỏ nhất trong cây con
    int minValue(Node root) {
        int minValue = root.value;
        while (root.left != null) { // Duyệt đến nút có giá trị nhỏ nhất
            minValue = root.left.value;
            root = root.left;
        }
        return minValue;
    }

    // Phương thức duyệt cây theo Trung tự (In-order Traversal)
    void inOrder() {
        inOrderRec(root);
    }

    // Phương thức đệ quy để duyệt cây theo Trung tự
    void inOrderRec(Node root) {
        if (root != null) {
            inOrderRec(root.left); // Duyệt cây con bên trái
            System.out.print(root.value + " "); // In giá trị của nút hiện tại
            inOrderRec(root.right); // Duyệt cây con bên phải
        }
    }

    // Phương thức xóa nút bằng cách sao chép (Deletion by Copying)
    void deleteByCopying(int value) {
        root = deleteByCopyingRec(root, value);
    }

    // Phương thức đệ quy để xóa nút bằng cách sao chép
    Node deleteByCopyingRec(Node root, int value) {
        if (root == null) // Nếu cây con rỗng, trả về null
            return root;

        if (value < root.value) // Nếu giá trị nhỏ hơn giá trị của nút hiện tại, xóa khỏi cây con bên trái
            root.left = deleteByCopyingRec(root.left, value);
        else if (value > root.value) // Nếu giá trị lớn hơn giá trị của nút hiện tại, xóa khỏi cây con bên phải
            root.right = deleteByCopyingRec(root.right, value);
        else { // Nếu giá trị bằng giá trị của nút hiện tại, đây là nút cần xóa
            if (root.left == null) // Nút chỉ có một con hoặc không có con
                return root.right;
            if (root.right == null)
                return root.left;

            Node temp = root.left;
            while (temp.right != null) { // Tìm nút có giá trị lớn nhất trong cây con bên trái
                temp = temp.right;
            }
            root.value = temp.value; // Sao chép giá trị lớn nhất của cây con bên trái vào nút hiện tại
            root.left = deleteRec(root.left, temp.value); // Xóa nút có giá trị lớn nhất đó
        }

        return root; // Trả về nút hiện tại
    }

    public static void main(String[] args) {
        BST tree = new BST();

        // Chèn các nút vào cây
        tree.insert(50);
        tree.insert(30);
        tree.insert(20);
        tree.insert(40);
        tree.insert(70);
        tree.insert(60);
        tree.insert(80);

        // In-order traversal của cây
        System.out.print("In-order traversal: ");
        tree.inOrder();
        System.out.println();

        // Tìm kiếm một nút
        System.out.println("Find: 40: " + (tree.search(40) ? "Found" : "Not found"));

        // Xóa một nút
        tree.delete(20);
        System.out.print("In-order traversal after delete 20: ");
        tree.inOrder();
        System.out.println();

        // Xóa bằng cách sao chép
        tree.deleteByCopying(30);
        System.out.print("In-order traversal after delete 30 (by copying): ");
        tree.inOrder();
        System.out.println();
    }
    
}
