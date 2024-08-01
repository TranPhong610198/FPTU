/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maxheap;

/**
 *
 * @author tphon
 */
public class Main {

    public static void main(String[] args) {
        MaxHeap maxHeap = new MaxHeap(10);
        maxHeap.add(10);
        maxHeap.add(15);
        maxHeap.add(20);
        maxHeap.add(17);
        maxHeap.add(25);

        System.out.println(maxHeap.poll()); // 25
        System.out.println(maxHeap.poll()); // 20
    }
}
