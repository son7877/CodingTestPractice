import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class Main {
    static int computers;
    static int network;
    static boolean [] visited;
    static Map<Integer, List<Integer>> map;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        computers = Integer.parseInt(br.readLine());
        network = Integer.parseInt(br.readLine());
        map = new HashMap<>();
        for(int i=0;i<network;i++){
            String [] str = br.readLine().split(" ");
            int n = Integer.parseInt(str[0]);
            int m = Integer.parseInt(str[1]);

            List<Integer> nlist = map.getOrDefault(n, new ArrayList<>());
            nlist.add(m);
            map.put(n,nlist);

            List<Integer> mlist = map.getOrDefault(m, new ArrayList<>());
            mlist.add(n);
            map.put(m,mlist);
        }
        visited = new boolean[computers+1];
        bfs(1);
    }
    public static void bfs(int node){
        Queue<Integer> queue = new LinkedList<>();
        queue.add(node);
        visited[node] = true;
        int count =0;
        while(!queue.isEmpty()){
            int nextNode = queue.poll();
            List<Integer> list = map.getOrDefault(nextNode, new ArrayList<>());
            for(int i=0;i<list.size();i++){
                if(!visited[list.get(i)]){
                    visited[list.get(i)]=true;
                    count++;
                    queue.add(list.get(i));
                }
            }
        }
        System.out.println(count);
    }
}
