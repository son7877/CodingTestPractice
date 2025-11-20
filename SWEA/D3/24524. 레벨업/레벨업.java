import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int T = sc.nextInt();
        for (int stage = 1; stage <= T; stage++) {
            int N = sc.nextInt();
            int[] pos = new int[N];
            for (int i = 0; i < N; i++) {
                pos[i] = sc.nextInt();
            }

            int min = Integer.MAX_VALUE;

            for (int i = 1; i < N - 1; i++) {
                int dis = 0;
                int preIndex = 0;
                for (int j = 1; j < N; j++) {
                    if (j == i) {
                        continue;
                    }
                    dis += Math.abs(pos[preIndex] - pos[j]);
                    preIndex = j;
                }
                if (dis < min) {
                    min = dis;
                }
            }

            System.out.println(min);
        }
    }
}
