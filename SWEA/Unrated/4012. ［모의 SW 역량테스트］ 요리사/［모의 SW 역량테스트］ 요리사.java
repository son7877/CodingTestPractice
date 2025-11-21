import java.util.*;

public class Solution {

    static int minDiff;
    static boolean[] isSelected;
    static int N;
    static int[][] table;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        sc.nextLine();

        for (int test_case = 1; test_case <= T ; test_case++) {
            N = sc.nextInt();
            sc.nextLine();

            table = new int[N][N];

            for (int i = 0; i < N; i++) {
                table[i] = Arrays.stream(sc.nextLine().split(" "))
                        .mapToInt(Integer::parseInt)
                        .toArray();
            }

            minDiff = Integer.MAX_VALUE;
            isSelected = new boolean[N];
            
            combination(0,0);


            System.out.println("#" + test_case + " " + minDiff);
        }
    }

    static void combination(int start, int count) {
        // 1. 종료 조건 (Base Case): N/2개를 모두 선택한 경우
        if (count == N / 2) {
            // A팀과 B팀의 맛 점수를 계산하고 차이를 업데이트
            calculate();
            return;
        }

        // 2. 남은 식재료를 모두 선택해도 N/2개를 채울 수 없는 경우
        if (N - start < N / 2 - count) {
            return;
        }

        // 3. 재귀 호출 (Recursive Step)
        for (int i = start; i < N; i++) {
            isSelected[i] = true;
            combination(i + 1, count + 1);

            // 백트래킹: i번 식재료를 A 음식에서 제외 (미선택)하고 다음 경우의 수를 탐색
            isSelected[i] = false;
        }
    }

    static void calculate() {
        int scoreA = 0;
        int scoreB = 0;

        for (int i = 0; i < N; i++) {
            for (int j = i+1; j < N; j++) {
                if (isSelected[i] && isSelected[j]) {
                    scoreA += table[i][j];
                    scoreA += table[j][i];
                } else if (!isSelected[i] && !isSelected[j]) {
                    scoreB += table[i][j];
                    scoreB += table[j][i];
                }
            }
        }

        minDiff = Math.min(minDiff, Math.abs(scoreA - scoreB));
    }
}
