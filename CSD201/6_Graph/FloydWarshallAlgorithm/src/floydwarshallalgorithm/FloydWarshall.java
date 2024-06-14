/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package floydwarshallalgorithm;

/**
 *
 * @author tphon
 */
public class FloydWarshall {

    final static int INF = 99999;

    public void floydWarshall(int graph[][], int V) {
        int dist[][] = new int[V][V];
        int path[][] = new int[V][V];

        for (int i = 0; i < V; i++) {
            for (int j = 0; j < V; j++) {
                dist[i][j] = graph[i][j];
                if (i == j || graph[i][j] >= INF) {
                    path[i][j] = 0;
                } else {
                    path[i][j] = i + 1;
                }
            }
        }

        for (int k = 0; k < V; k++) {
            for (int i = 0; i < V; i++) {
                for (int j = 0; j < V; j++) {
                    if (dist[i][k]!= INF && dist[k][j]!= INF && dist[i][k] + dist[k][j] < dist[i][j]) {
                        dist[i][j] = dist[i][k] + dist[k][j];
                        path[i][j] = path[k][j];
                    }
                }
            }
        }

        printMatrix(dist, V, "Shortest path matrix");
        printMatrix(path, V, "Previous edge matrix");

    }

    void printMatrix(int dist[][], int V, String str) {
        System.out.println("\033[33m" + str + "\033[0m");

        System.out.print(" ");
        for (int i = 0; i < V; i++) {
            System.out.print("\033[36m   " + (i + 1));
        }
        System.out.println("\033[0m");

        for (int i = 0; i < V; ++i) {
            System.out.print("\033[36m" + (i + 1) + "   \033[0m");
            for (int j = 0; j < V; ++j) {
                if (dist[i][j] == INF) {
                    System.out.print("INF ");
                } else {
                    System.out.print(dist[i][j] + "   ");
                }
            }
            System.out.println();
        }
    }
}
