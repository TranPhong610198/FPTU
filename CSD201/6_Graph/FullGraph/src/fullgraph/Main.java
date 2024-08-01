/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fullgraph;

/**
 *
 * @author tphon
 */
public class Main {
    public static void main(String args[]) {
        FullGraph g = new FullGraph(5);

        g.addEdge(0, 1);
        g.addEdge(0, 4);
        g.addEdge(1, 2);
        g.addEdge(1, 3);
        g.addEdge(1, 4);
        g.addEdge(2, 3);
        g.addEdge(3, 4);

        System.out.println("Following is Breadth First Traversal (starting from vertex 2)");
        g.BFS(2);

        System.out.println("\n\nFollowing is Depth First Traversal (starting from vertex 2)");
        g.DFS(2);

        System.out.println("\n\nDijkstra's Algorithm");
        g.dijkstra(0);

        System.out.println("\n\nFloyd-Warshall Algorithm");
        g.floydWarshall();

        System.out.println("\n\nPrim's MST");
        g.primMST();

        System.out.println("\n\nKruskal's MST");
        g.KruskalMST();

        System.out.println("\n\nEulerian Path Check");
        System.out.println("Graph is Eulerian: " + g.isEulerian());
    }
}

