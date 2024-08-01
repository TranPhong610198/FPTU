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
import java.util.*;

public class FullGraph {

    private int V; // Số đỉnh của đồ thị
    private LinkedList<Integer> adj[]; // Danh sách kề cho đồ thị
    private int[][] matrix; // Ma trận trọng số cho các thuật toán

    // Khởi tạo đồ thị với V đỉnh
    public FullGraph(int v) {
        V = v;
        adj = new LinkedList[v];
        for (int i = 0; i < v; ++i) {
            adj[i] = new LinkedList();
        }
        matrix = new int[v][v];
    }

    // Thêm cạnh vào đồ thị
    void addEdge(int v, int w) {
        adj[v].add(w);
        adj[w].add(v);
        matrix[v][w] = 1;
        matrix[w][v] = 1;
    }

    // Duyệt đồ thị theo chiều rộng từ đỉnh s
    void BFS(int s) {
        boolean visited[] = new boolean[V];
        LinkedList<Integer> queue = new LinkedList<Integer>();

        visited[s] = true;
        queue.add(s);

        while (queue.size() != 0) {
            s = queue.poll();
            System.out.print(s + " ");

            Iterator<Integer> i = adj[s].listIterator();
            while (i.hasNext()) {
                int n = i.next();
                if (!visited[n]) {
                    visited[n] = true;
                    queue.add(n);
                }
            }
        }
    }

    // Hàm đệ quy cho DFS
    void DFSUtil(int v, boolean visited[]) {
        visited[v] = true;
        System.out.print(v + " ");

        Iterator<Integer> i = adj[v].listIterator();
        while (i.hasNext()) {
            int n = i.next();
            if (!visited[n]) {
                DFSUtil(n, visited);
            }
        }
    }

    // Duyệt đồ thị theo chiều sâu từ đỉnh v
    void DFS(int v) {
        boolean visited[] = new boolean[V];
        DFSUtil(v, visited);
    }

    // Tìm đỉnh có khoảng cách nhỏ nhất trong tập các đỉnh chưa được bao phủ bởi SPT
    int minDistance(int dist[], boolean sptSet[]) {
        int min = Integer.MAX_VALUE, min_index = -1;

        for (int v = 0; v < V; v++) {
            if (!sptSet[v] && dist[v] <= min) {
                min = dist[v];
                min_index = v;
            }
        }

        return min_index;
    }

    // Thuật toán Dijkstra cho đường đi ngắn nhất từ đỉnh src
    void dijkstra(int src) {
        int dist[] = new int[V];
        boolean sptSet[] = new boolean[V];

        for (int i = 0; i < V; i++) {
            dist[i] = Integer.MAX_VALUE;
            sptSet[i] = false;
        }

        dist[src] = 0;

        for (int count = 0; count < V - 1; count++) {
            int u = minDistance(dist, sptSet);
            sptSet[u] = true;

            for (int v = 0; v < V; v++) {
                if (!sptSet[v] && matrix[u][v] != 0
                        && dist[u] != Integer.MAX_VALUE && dist[u] + matrix[u][v] < dist[v]) {
                    dist[v] = dist[u] + matrix[u][v];
                }
            }
        }

        printSolution(dist);
    }

    // In kết quả của thuật toán Dijkstra
    void printSolution(int dist[]) {
        System.out.println("Vertex \t Distance from Source");
        for (int i = 0; i < V; i++) {
            System.out.println(i + " \t\t " + dist[i]);
        }
    }

    // Thuật toán Floyd-Warshall cho tất cả các cặp đỉnh
    void floydWarshall() {
        int dist[][] = new int[V][V];
        int i, j, k;

        for (i = 0; i < V; i++) {
            for (j = 0; j < V; j++) {
                dist[i][j] = matrix[i][j];
            }
        }

        for (k = 0; k < V; k++) {
            for (i = 0; i < V; i++) {
                for (j = 0; j < V; j++) {
                    if (dist[i][j] > dist[i][k] + dist[k][j]) {
                        dist[i][j] = dist[i][k] + dist[k][j];
                    }
                }
            }
        }

        printSolutionFloyd(dist);
    }

    // In kết quả của thuật toán Floyd-Warshall
    void printSolutionFloyd(int dist[][]) {
        System.out.println("Shortest distances between every pair of vertices");
        for (int i = 0; i < V; i++) {
            for (int j = 0; j < V; j++) {
                if (dist[i][j] == Integer.MAX_VALUE) {
                    System.out.print("INF ");
                } else {
                    System.out.print(dist[i][j] + " ");
                }
            }
            System.out.println();
        }
    }

    // Tìm đỉnh có trọng số nhỏ nhất không nằm trong MST
    int minKey(int key[], boolean mstSet[]) {
        int min = Integer.MAX_VALUE, min_index = -1;

        for (int v = 0; v < V; v++) {
            if (!mstSet[v] && key[v] < min) {
                min = key[v];
                min_index = v;
            }
        }

        return min_index;
    }

    // Thuật toán Prim cho cây khung nhỏ nhất (MST)
    void primMST() {
        int parent[] = new int[V];
        int key[] = new int[V];
        boolean mstSet[] = new boolean[V];

        for (int i = 0; i < V; i++) {
            key[i] = Integer.MAX_VALUE;
            mstSet[i] = false;
        }

        key[0] = 0;
        parent[0] = -1;

        for (int count = 0; count < V - 1; count++) {
            int u = minKey(key, mstSet);
            mstSet[u] = true;

            for (int v = 0; v < V; v++) {
                if (matrix[u][v] != 0 && !mstSet[v] && matrix[u][v] < key[v]) {
                    parent[v] = u;
                    key[v] = matrix[u][v];
                }
            }
        }

        printMST(parent);
    }

    // In kết quả của thuật toán Prim
    void printMST(int parent[]) {
        System.out.println("Edge \tWeight");
        for (int i = 1; i < V; i++) {
            System.out.println(parent[i] + " - " + i + "\t" + matrix[i][parent[i]]);
        }
    }

    // Class con đại diện cho một cạnh và sử dụng trong thuật toán Kruskal
    class Edge implements Comparable<Edge> {

        int src, dest, weight;

        public int compareTo(Edge compareEdge) {
            return this.weight - compareEdge.weight;
        }
    }

    // Class con đại diện cho một tập hợp trong thuật toán Kruskal
    class subset {

        int parent, rank;
    }

    // Tìm tập hợp của phần tử i với path compression
    int find(subset subsets[], int i) {
        if (subsets[i].parent != i) {
            subsets[i].parent = find(subsets, subsets[i].parent);
        }
        return subsets[i].parent;
    }

    // Hợp nhất hai tập hợp x và y với union by rank
    void Union(subset subsets[], int x, int y) {
        int xroot = find(subsets, x);
        int yroot = find(subsets, y);

        if (subsets[xroot].rank < subsets[yroot].rank) {
            subsets[xroot].parent = yroot;
        } else if (subsets[xroot].rank > subsets[yroot].rank) {
            subsets[yroot].parent = xroot;
        } else {
            subsets[yroot].parent = xroot;
            subsets[xroot].rank++;
        }
    }

    // Thuật toán Kruskal cho cây khung nhỏ nhất (MST)
    void KruskalMST() {
        Edge result[] = new Edge[V];
        int e = 0;
        int i = 0;
        for (i = 0; i < V; ++i) {
            result[i] = new Edge();
        }

        ArrayList<Edge> edges = new ArrayList<>();
        for (int u = 0; u < V; u++) {
            for (int v = u + 1; v < V; v++) {
                if (matrix[u][v] != 0) {
                    Edge edge = new Edge();
                    edge.src = u;
                    edge.dest = v;
                    edge.weight = matrix[u][v];
                    edges.add(edge);
                }
            }
        }

        Collections.sort(edges);

        subset subsets[] = new subset[V];
        for (i = 0; i < V; ++i) {
            subsets[i] = new subset();
        }

        for (int v = 0; v < V; ++v) {
            subsets[v].parent = v;
            subsets[v].rank = 0;
        }

        i = 0;
        while (e < V - 1) {
            Edge next_edge = edges.get(i++);

            int x = find(subsets, next_edge.src);
            int y = find(subsets, next_edge.dest);

            if (x != y) {
                result[e++] = next_edge;
                Union(subsets, x, y);
            }
        }

        System.out.println("Following are the edges in the constructed MST");
        for (i = 0; i < e; ++i) {
            System.out.println(result[i].src + " -- " + result[i].dest + " == " + result[i].weight);
        }
    }

    // Kiểm tra xem đồ thị có chứa đường Eulerian hay không
    boolean isEulerian() {
        int odd = 0;
        for (int i = 0; i < V; i++) {
            if (adj[i].size() % 2 != 0) {
                odd++;
            }
        }

        if (odd > 2) {
            return false;
        }

        return (odd == 0) ? true : false;
    }
}
