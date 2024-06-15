/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package btvn_graph;
import java.io.IOException;

/**
 *
 * @author tphon
 */
public class Main {

    /**
     * @param args the command line arguments
     */
        public static void main(String[] args) {
        WGraph graph = new WGraph();

        try {
            int[][] matrix = graph.readAdjacencyMatrix("adjacency_matrix.txt");
            graph.setAMatrix(matrix, matrix.length);

            System.out.println("Breadth-First Traversal starting from vertex A:");
            graph.breadthFirstTraversal(0);

            System.out.println("Depth-First Traversal starting from vertex A:");
            graph.depthFirstTraversal(0);

            System.out.println("Dijkstra's shortest path algorithm starting from vertex A:");
            graph.dijkstra(0);

        } catch (IOException e) {
            System.err.println("Error reading files: " + e.getMessage());
        }
    }
    
}
