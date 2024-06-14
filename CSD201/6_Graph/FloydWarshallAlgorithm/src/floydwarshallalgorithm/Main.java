/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package floydwarshallalgorithm;

/**
 *
 * @author tphon
 */
public class Main {

    final static int INF = 99999;

    public static void main(String[] args) {
        FloydWarshall a = new FloydWarshall();
//        int graph[][] = { 
//            {0, 5, INF, 9, 1}, 
//            {5, 0, 2, INF, INF}, 
//            {INF, 2, 0, 7, INF}, 
//            {9, INF, 7, 0, 2},
//            {1, INF, INF, 2, 0} 
//        };
//        int V = 5;
        int graph[][] = {
            {0, 1, INF, INF},
            {INF, 0, 3, INF},
            {INF, INF, 0, -5},
            {INF, INF, INF, 0}
        };
        int V = 4;
        a.printMatrix(graph, V, "Weighted Matrix");
        a.floydWarshall(graph, V);
    }
}
