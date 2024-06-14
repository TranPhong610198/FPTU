/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package btvn_bstree;

import java.util.*;

/**
 *
 * @author tphon
 */
public class MyTree {

    Node root;

    public boolean isEmpty() {
        return root == null;
    }

    public void clear() {
        root = null;
    }

    public Node search(int x) {
        return searchRec(root, x);
    }

    public Node searchRec(Node root, int x) {
        if (root == null || root.value == x) {
            return root;
        }
        if (root.value > x) {
            return searchRec(root.left, x);
        }
        return searchRec(root.right, x);
    }

    public void insert(int x) {
        root = insertRec(root, x);
    }

    public Node insertRec(Node root, int x) {
        if (root == null) {
            root = new Node(x);
            return root;
        }
        if (x < root.value) {
            root.left = insertRec(root.left, x);
        } else if (x > root.value) {
            root.right = insertRec(root.right, x);
        }
        return root;
    }

    public void breadth() {
        if (root == null) {
            return;
        }
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        while (!queue.isEmpty()) {
            Node tempNode = queue.poll();
            System.out.print(tempNode.value + " ");
            if (tempNode.left != null) {
                queue.add(tempNode.left);
            }
            if (tempNode.right != null) {
                queue.add(tempNode.right);
            }
        }
    }

    public void preorder(Node node) {
        if (node != null) {
            System.out.print(node.value + " ");
            preorder(node.left);
            preorder(node.right);
        }
    }

    public void inorder(Node node) {
        if (node != null) {
            inorder(node.left);
            System.out.print(node.value + " ");
            inorder(node.right);
        }
    }

    public void postorder(Node node) {
        if (node != null) {
            postorder(node.left);
            postorder(node.right);
            System.out.print(node.value + " ");
        }
    }

    public int count() {
        return countRec(root);
    }

    public int countRec(Node root) {
        if (root == null) {
            return 0;
        }
        return 1 + countRec(root.left) + countRec(root.right);
    }

    public void dele(int x) {
        if (search(x) != null) {
            root = deleteRec(root, x);
        } else {
            System.err.println(x+" not exist in tree!!!");
        }
    }

    public Node deleteRec(Node root, int x) {
        if (root == null) {
            return root;
        }

        if (x < root.value) {
            root.left = deleteRec(root.left, x);
        } else if (x > root.value) {
            root.right = deleteRec(root.right, x);
        } else {
            if (root.left == null) {
                return root.right;
            } else if (root.right == null) {
                return root.left;
            }

            root.value = minValue(root.right);
            root.right = deleteRec(root.right, root.value);
        }
        return root;
    }

    public int minValue(Node root) {
        int minv = root.value;
        while (root.left != null) {
            minv = root.left.value;
            root = root.left;
        }
        return minv;
    }

    public Node min() {
        return minRec(root);
    }

    public Node minRec(Node root) {
        if (root == null) {
            return null;
        }
        while (root.left != null) {
            root = root.left;
        }
        return root;
    }

    public Node max() {
        return maxRec(root);
    }

    public Node maxRec(Node root) {
        if (root == null) {
            return null;
        }
        while (root.right != null) {
            root = root.right;
        }
        return root;
    }

    public int sum() {
        return sumRec(root);
    }

    public int sumRec(Node root) {
        if (root == null) {
            return 0;
        }
        return root.value + sumRec(root.left) + sumRec(root.right);
    }

    public int avg() {
        int totalSum = sum();
        int totalCount = count();
        return totalCount == 0 ? 0 : totalSum / totalCount;
    }

    public int height() {
        return heightRec(root);
    }

    public int heightRec(Node root) {
        if (root == null) {
            return 0;
        }
        int leftHeight = heightRec(root.left);
        int rightHeight = heightRec(root.right);
        return Math.max(leftHeight, rightHeight) + 1;
    }

    public ArrayList<Integer> toArray() {
        ArrayList<Integer> arr = new ArrayList<>();
        stepToArray(arr, root);
        return arr;
    }

    public void stepToArray(ArrayList<Integer> arr, Node root) {
        if (root != null) {
            stepToArray(arr, root.left);
            arr.add(root.value);
            stepToArray(arr, root.right);
        }
    }

    public void stepBalance(ArrayList<Integer> arr, int l, int r) {
        if (l <= r) {
            int m = (l + r) / 2;
            insert(arr.get(m));
            stepBalance(arr, l, m - 1);
            stepBalance(arr, m + 1, r);
        }
    }

    public void balance() {
        ArrayList<Integer> arr = toArray();
        clear();

        stepBalance(arr, 0, arr.size() - 1);
    }

}
