/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package btvn_bstree;

import java.util.*;

/**
 *
 * @author tphon
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        MyTree tree = new MyTree();

        tree.insert(90);
        tree.insert(80);
        tree.insert(70);
        tree.insert(60);
        tree.insert(50);
        tree.insert(40);
        tree.insert(25);

        // Test traversal methods
        System.out.print("Breadth-first traversal: ");
        tree.breadth();
        System.out.println();

        System.out.print("Preorder traversal: ");
        tree.preorder(tree.root);
        System.out.println();

        System.out.print("Inorder traversal: ");
        tree.inorder(tree.root);
        System.out.println();

        System.out.print("Postorder traversal: ");
        tree.postorder(tree.root);
        System.out.println();

        // Test search
        System.out.println("Search for 40: " + (tree.search(40) != null));
        System.out.println("Search for 90: " + (tree.search(90) != null));

        // Test min and max
        System.out.println("Minimum value: " + tree.min().value);
        System.out.println("Maximum value: " + tree.max().value);

        // Test count
        System.out.println("Node count: " + tree.count());

        // Test sum and average
        System.out.println("Sum of values: " + tree.sum());
        System.out.println("Average of values: " + tree.avg());

        // Test height
        System.out.println("Height of tree: " + tree.height());

        // Test delete
        tree.dele(30);
        System.out.print("Inorder traversal after deletion of 30: ");
        tree.inorder(tree.root);
        System.out.println();
    
        
        tree.balance();
        
        ArrayList<Integer> arr = tree.toArray();
        System.out.println(arr);
        
        System.out.print("Preorder traversal: ");
        tree.preorder(tree.root);
        System.out.println();

        System.out.print("Inorder traversal: ");
        tree.inorder(tree.root);
        System.out.println();
    }
    
}
