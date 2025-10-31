
import java.util.*;

class Solution
{
    public static void main(String args[]) throws Exception
    {
        Scanner sc = new Scanner(System.in);
        int T;
        T=10;

        for(int test_case = 1; test_case <= T; test_case++)
        {
            // 답안
            int[] line = Arrays.stream(sc.nextLine().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();

            int[] route = Arrays.stream(sc.nextLine().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();

            int answer = getAnswer(route);

            System.out.println("#" + line[0] + " " + answer);
        }
    }

    private static int getAnswer(int [] route) {
        int answer =0;

        // 경로 map (일방통행)
        HashMap<Integer,  List<Integer>> map = new HashMap<>();
        for (int i = 0; i < route.length/2; i++) {
            int from = route[i*2];
            int to = route[i*2+1];

            if (!map.containsKey(from)) {
                map.put(from, new ArrayList<>());
            }
            map.get(from).add(to);

        }

        Set<Integer> visited = new HashSet<>();
        
        return bfs(0, 99, map, visited) ? 1 : 0;
    }

    private static boolean dfs(
            int start, int end, HashMap<Integer, List<Integer>> map, Set<Integer> visited) {
        if (start == end) {
            return true;
        }

        visited.add(start);

        if (!map.containsKey(start)) {
            return false;
        }

        for (int next : map.get(start)) {
            if (!visited.contains(next)) { //
                if (dfs(next, end, map, visited)) {
                    return true;
                }
            }
        }

        return false;
    }
    
    private static boolean bfs(
            int start, int end, HashMap<Integer, List<Integer>> map, Set<Integer> visited
    ) {
        Queue<Integer> queue = new LinkedList<>();
        
        queue.add(start);
        
        while(!queue.isEmpty()) {
            int current = queue.poll();

            if (current == end) {
                return true;
            }
            
            if (!map.containsKey(current)) {
                continue;
            }
            
            for (int next : map.get(current)) {
                if (!visited.contains(next)) {
                    queue.add(next);
                    visited.add(next);
                }
            }
        }
        
        return false;
    }
}