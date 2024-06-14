package dijkstraalgorithm;

import java.util.Arrays;
import java.util.PriorityQueue;

public class Main {

    public static void main(String[] args) {
        int vertices = 6;
        Graph graph = new Graph(vertices);

        // Adding edges to the graph
//        graph.addEdge(0, 1, 7);
//        graph.addEdge(0, 2, 9);
//        graph.addEdge(0, 5, 14);
//        graph.addEdge(1, 2, 10);
//        graph.addEdge(1, 3, 15);
//        graph.addEdge(2, 3, 11);
//        graph.addEdge(2, 5, 2);
//        graph.addEdge(3, 4, 6);
//        graph.addEdge(4, 5, 9);
        graph.adjacencyMatrix[0][1] = 4;
        graph.adjacencyMatrix[0][2] = 1;
        graph.adjacencyMatrix[1][3] = 1;
        graph.adjacencyMatrix[2][1] = 2;
        graph.adjacencyMatrix[2][3] = 5;
        graph.adjacencyMatrix[3][4] = 3;
        graph.adjacencyMatrix[4][5] = 1;
        graph.adjacencyMatrix[3][5] = 2;

        int startVertex = 0; // A
        int endVertex = 4;   // E

        graph.dijkstra(startVertex, endVertex);
    }
}
