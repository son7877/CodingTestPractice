import java.util.*;

public class Solution {

    static int[][] board;
    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};
    static Set<String> result;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        sc.nextLine();

        for (int test_case = 1; test_case <= T; test_case++) {
            board = new int[4][4];

            for (int i = 0; i < 4; i++) {
                board[i] = Arrays.stream(sc.nextLine().split(" "))
                        .mapToInt(Integer::parseInt)
                        .toArray();
            }

            result = new HashSet<>();

            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4; j++) {
                    dfs(i, j, String.valueOf(board[i][j]));
                }
            }

            System.out.println("#" + test_case + " " + result.size());

        }
        sc.close();
    }

    static void dfs(int x, int y, String number) {
        if (number.length() == 7) {
            result.add(number);
            return;
        }

        for (int i = 0; i < 4; i++) {
            int nx = x + dx[i];
            int ny = y + dy[i];

            if (nx >= 0 && nx < 4 && ny >= 0 && ny < 4) {
                dfs(nx, ny, number + board[nx][ny]);
            }
        }
    }
}