import java.util.PriorityQueue;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        StringBuilder sb = new StringBuilder();

        while (N-- > 0) {
            int x = sc.nextInt();
            if (x == 0) { // 0이 입력되면
                if (pq.isEmpty()) { // 비어있는 경우면 0 출력
                    sb.append(0).append('\n');
                } else { // 비어있지 않은 경우 최소값 출력
                    sb.append(pq.poll()).append('\n');
                }
            } else {
                pq.offer(x); 
            }
        }
        System.out.println(sb);
    }
}
