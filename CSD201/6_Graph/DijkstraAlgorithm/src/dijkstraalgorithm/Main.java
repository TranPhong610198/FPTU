package dijkstraalgorithm;

import java.util.Arrays;
import java.util.PriorityQueue;

public class Main {
    
    static class Node implements Comparable<Node> {
        int vertex, distance;

        Node(int vertex, int distance) {
            this.vertex = vertex;
            this.distance = distance;
        }

        @Override
        public int compareTo(Node other) {
            return Integer.compare(this.distance, other.distance);
        }
    }

    static class Graph {
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

        void addEdge(int source, int target, int weight) {
            adjacencyMatrix[source][target] = weight;
            adjacencyMatrix[target][source] = weight; // For undirected graph
        }

        void dijkstra(int startVertex, int endVertex) {
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

    public static void main(String[] args) {
        int vertices = 6;
        Graph graph = new Graph(vertices);

        // Adding edges to the graph
        graph.addEdge(0, 1, 7);
        graph.addEdge(0, 2, 9);
        graph.addEdge(0, 5, 14);
        graph.addEdge(1, 2, 10);
        graph.addEdge(1, 3, 15);
        graph.addEdge(2, 3, 11);
        graph.addEdge(2, 5, 2);
        graph.addEdge(3, 4, 6);
        graph.addEdge(4, 5, 9);

        int startVertex = 0; // A
        int endVertex = 4;   // E

        graph.dijkstra(startVertex, endVertex);
    }
}
