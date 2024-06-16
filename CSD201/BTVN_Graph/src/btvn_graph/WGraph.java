/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package btvn_graph;

/**
 *
 * @author tphon
 */
import java.nio.file.*;
import java.io.IOException;
import java.util.*;

public class WGraph {

    private int[][] adjMatrix;
    private int n;

    public void setAMatrix(int[][] inMatrix, int vertices) {
        n = vertices;
        adjMatrix = new int[n][n];
        for (int i = 0; i < n; i++) {
            System.arraycopy(inMatrix[i], 0, adjMatrix[i], 0, n);
        }
    }

    public void breadthFirstTraversal(int start) {
        boolean[] visited = new boolean[n];
        Queue<Integer> queue = new LinkedList<>();
        visited[start] = true;
        queue.add(start);

        while (!queue.isEmpty()) {
            int v = queue.poll();
            System.out.print((char) ('A' + v) + " ");
            for (int i = 0; i < n; i++) {
                if (adjMatrix[v][i] != 0 && !visited[i]) {
                    visited[i] = true;
                    queue.add(i);
                }
            }
        }
        System.out.println();
    }

    public void depthFirstTraversal(int startVertex) {
        boolean[] visited = new boolean[n];
        Stack<Integer> stack = new Stack<>();

        visited[startVertex] = true;
        stack.push(startVertex);

        while (!stack.isEmpty()) {
            int currentVertex = stack.pop();

            System.out.print((char) ('A' + currentVertex) + " ");
            for (int i = 0; i < n; i++) {
                if (adjMatrix[currentVertex][i] > 0 && !visited[i]) {
                    visited[i] = true;
                    stack.push(i);
                }
            }
        }
        System.out.println();
    }

    public void dijkstra(int start) {
        int[] dist = new int[n];
        boolean[] sptSet = new boolean[n];
        int[] pred = new int[n];

        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[start] = 0;
        Arrays.fill(pred, -1);

        for (int count = 0; count < n - 1; count++) {
            int u = minDistance(dist, sptSet);
            sptSet[u] = true;

            for (int v = 0; v < n; v++) {
                if (!sptSet[v] && adjMatrix[u][v] != 0
                        && dist[u] != Integer.MAX_VALUE
                        && dist[u] + adjMatrix[u][v] < dist[v]) {
                    dist[v] = dist[u] + adjMatrix[u][v];
                    pred[v] = u;
                }
            }
        }

        printDijkstra(dist, pred, start);
    }

    private int minDistance(int[] dist, boolean[] sptSet) {
        int min = Integer.MAX_VALUE, min_index = -1;

        for (int v = 0; v < n; v++) {
            if (!sptSet[v] && dist[v] <= min) {
                min = dist[v];
                min_index = v;
            }
        }
        return min_index;
    }

    private void printDijkstra(int[] dist, int[] pred, int start) {
        System.out.println("Vertex \t Distance from Source");
        for (int i = 0; i < n; i++) {
            if (i != start) {
                System.out.print((char) ('A' + start) + "->" + (char) ('A' + i)
                        + " \t\t" + dist[i] + "\t\t");
                printPath(i, pred);
                System.out.println("");
            }
        }
    }

    public void printPath(int current, int[] pred){
        if (pred[current] == -1) {
            System.out.print((char) ('A' + current));
            return;
        }
        printPath(pred[current], pred);
        System.out.print(" -> " + (char) ('A' + current));
    }    
    
    public int[][] readAdjacencyMatrix(String filename) throws IOException {
        List<String> lines = Files.readAllLines(Paths.get(filename));
        int size = lines.size();
        int[][] matrix = new int[size][size];
        for (int i = 0; i < size; i++) {
            String[] parts = lines.get(i).split(" ");
            for (int j = 0; j < size; j++) {
                matrix[i][j] = Integer.parseInt(parts[j]);
            }
        }
        return matrix;
    }

}
