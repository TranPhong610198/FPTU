
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myheap;

/**
 *
 * @author tphon
 */
public class Main {

    public static void main(String[] args) {
        MinHeap minHeap = new MinHeap(10);
        minHeap.add(10);
        minHeap.add(15);
        minHeap.add(20);
        minHeap.add(17);
        minHeap.add(25);

        System.out.println(minHeap.poll()); // 10
        System.out.println(minHeap.poll()); // 15
    }

}
