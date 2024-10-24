import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.HashMap;
import java.util.PriorityQueue;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int i = 0; i < T; i++) {
            int k = Integer.parseInt(br.readLine());
            PriorityQueue<Integer> minPq = new PriorityQueue<>();
            PriorityQueue<Integer> maxPq = new PriorityQueue<>(Collections.reverseOrder());
            HashMap<Integer, Integer> map = new HashMap<>();

            for (int j = 0; j < k; j++) {
                String[] cmd = br.readLine().split(" ");
                int num = Integer.parseInt(cmd[1]);

                if (cmd[0].equals("I")) { // insert
                    minPq.add(num);
                    maxPq.add(num);
                    map.put(num, map.getOrDefault(num, 0) + 1);
                } else { // delete
                    if (num == 1) {
                        if (!maxPq.isEmpty()) {
                            remove(maxPq, map);
                        }
                    } else {
                        if (!minPq.isEmpty()) {
                            remove(minPq, map);
                        }
                    }
                }
            }

            while (!minPq.isEmpty() && map.get(minPq.peek()) == 0) {
                minPq.poll();
            }
            while (!maxPq.isEmpty() && map.get(maxPq.peek()) == 0) {
                maxPq.poll();
            }

            if (minPq.isEmpty() && maxPq.isEmpty()) {
                System.out.println("EMPTY");
            } else {
                System.out.println(maxPq.peek() + " " + minPq.peek());
            }
        }
    }

    private static void remove(PriorityQueue<Integer> pq, HashMap<Integer, Integer> map) {
        while (!pq.isEmpty()) {
            int num = pq.poll();
            int count = map.getOrDefault(num, 0);
            if (count > 0) {
                map.put(num, count - 1);
                break;
            }
        }
    }
}