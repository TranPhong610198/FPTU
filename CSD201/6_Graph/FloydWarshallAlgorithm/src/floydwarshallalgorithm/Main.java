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
        int graph[][] = { 
            {0,   2, INF,   6, INF}, 
            {2,   0,   3,   8,   5}, 
            {INF, 3,   0, INF,   7}, 
            {6,   8, INF,   0,   9},
            {INF, 5,   7,   9,   0} 
        };
        int V = 5;
//        int graph[][] = {
//            {0, 1, INF, INF},
//            {INF, 0, 3, INF},
//            {INF, INF, 0, -5},
//            {INF, INF, INF, 0}
//        };
//        int V = 4;
        a.printMatrix(graph, V, "Weighted Matrix");
        a.floydWarshall(graph, V);
    }
}
