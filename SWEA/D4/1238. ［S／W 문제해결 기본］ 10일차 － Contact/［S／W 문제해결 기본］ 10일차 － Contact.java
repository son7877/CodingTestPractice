import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;
        for(int test_case=1;test_case<=T;test_case++){
            String[] input = sc.nextLine().trim().split(" ");

            int length = Integer.parseInt(input[0]);
            int start = Integer.parseInt(input[1]);

            int[] data = Arrays.stream(sc.nextLine().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();

            List<Integer>[] graph = new ArrayList[101];
            for(int i=0; i<= 100; i++){
                graph[i] = new ArrayList<>();
            }
            
            for(int i=0;i<data.length;i+=2){
                graph[data[i]].add(data[i+1]);
            }

            int[] distance = new int[101];
            Arrays.fill(distance, -1);
            distance[start] = 0;

            Queue<Integer> queue = new LinkedList<>();
            queue.offer(start);

            while(!queue.isEmpty()){
                int current = queue.poll();

                for(int next : graph[current]){
                    if(distance[next] == -1){
                        distance[next] = distance[current] + 1;
                        queue.offer(next);
                    }
                }
            }

            // 최대 거리 찾기
            int maxDistance = 0;
            for(int i = 1; i <= 100; i++){
                if(distance[i] != -1){
                    maxDistance = Math.max(maxDistance, distance[i]);
                }
            }

            // 최대 거리에서 가장 큰 번호 찾기
            int answer = 0;
            for(int i = 1; i <= 100; i++){
                if(distance[i] == maxDistance){
                    answer = i;
                }
            }

            System.out.println("#" + test_case + " " + answer);
        }
    }
}
