import java.util.PriorityQueue;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        PriorityQueue<Integer> pq = new PriorityQueue<>();

        int N = sc.nextInt();
        for (int i = 0; i < N; i++) {
            pq.offer(sc.nextInt());
        }

        int sum = 0;
        while (pq.size() > 1) {
            int a = pq.poll();
            int b = pq.poll();
            sum += a + b;
            pq.offer(a + b);
        }

        System.out.println(sum);
    }
}
