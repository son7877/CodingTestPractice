import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        sc.nextLine();

        for (int test_case = 1; test_case <= T ; test_case++) {
            int N = sc.nextInt();
            sc.nextLine();

            int[][] farm = new int[N][N];

            for (int i = 0; i < N; i++) {
                String line = sc.nextLine();
                for (int j = 0; j < N; j++) {
                    farm[i][j] = line.charAt(j) - '0';
                }
            }

            int center = N / 2;
            int sum = 0;

            for (int i = 0; i < N; i++) {
                int start = Math.abs(center - i);
                int end =   (N-1) - start;


                for (int j = start; j <= end; j++) {
                    sum += farm[i][j];
                }
            }

            System.out.println("#" + test_case + " " + sum);
        }
    }
}
