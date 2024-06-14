/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dijkstraalgorithm;
import java.util.*;
/**
 *
 * @author tphon
 */

    public class Graph {
        int vertices;
        int[][] adjacencyMatrix;

        Graph(int vertices) {
            this.vertices = vertices;
            adjacencyMatrix = new int[vertices][vertices];
            for (int i = 0; i < vertices; i++) {
                Arrays.fill(adjacencyMatrix[i], Integer.MAX_VALUE);
                adjacencyMatrix[i][i] = 0;
            }
        }

        public void addEdge(int source, int target, int weight) {
            adjacencyMatrix[source][target] = weight;
            adjacencyMatrix[target][source] = weight; // For undirected graph
        }

        public void dijkstra(int startVertex, int endVertex) {
            int[] distances = new int[vertices];
            boolean[] settled = new boolean[vertices];
            int[] parent = new int[vertices];

            PriorityQueue<Node> pq = new PriorityQueue<>();

            Arrays.fill(distances, Integer.MAX_VALUE);
            Arrays.fill(parent, -1);

            distances[startVertex] = 0;
            pq.add(new Node(startVertex, 0));

            while (!pq.isEmpty()) {
                int u = pq.poll().vertex;
                if (!settled[u]) {
                    settled[u] = true;
                    evaluateNeighbours(u, distances, settled, pq, parent);
                }
            }

            printShortestPath(distances, parent, startVertex, endVertex);
        }

        void evaluateNeighbours(int u, int[] distances, boolean[] settled, PriorityQueue<Node> pq, int[] parent) {
            for (int v = 0; v < vertices; v++) {
                if (!settled[v] && adjacencyMatrix[u][v] != Integer.MAX_VALUE) {
                    int newDistance = distances[u] + adjacencyMatrix[u][v];

                    if (newDistance < distances[v]) {
                        distances[v] = newDistance;
                        parent[v] = u;
                        pq.add(new Node(v, newDistance));
                    }
                }
            }
        }

        void printShortestPath(int[] distances, int[] parent, int startVertex, int endVertex) {
            System.out.println("The length of shortest path from " + (char) ('A' + startVertex) + " to " + (char) ('A' + endVertex) + " is " + distances[endVertex]);
            System.out.print("Path: ");
            printPath(parent, endVertex);
            System.out.println();
        }

        void printPath(int[] parent, int vertex) {
            if (parent[vertex] == -1) {
                System.out.print((char) ('A' + vertex));
                return;
            }
            printPath(parent, parent[vertex]);
            System.out.print(" -> " + (char) ('A' + vertex));
        }
    }
