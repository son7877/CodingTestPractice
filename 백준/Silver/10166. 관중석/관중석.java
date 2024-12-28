import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] inputs = br.readLine().split(" ");

        int D1 = Integer.parseInt(inputs[0]);
        int D2 = Integer.parseInt(inputs[1]);

        solution(D1, D2);
    }

    static void solution(int D1, int D2) {
//        Set<Integer> uniqueAngles = new HashSet<>();
        boolean visited[][] = new boolean[D2 + 1][D2 + 1];

        for (int i = D1; i <= D2; i++) {
            for (int j = 1; j <= i; j++) {
                int gcd = gcd(i, j);
                int d1 = i / gcd;
                int d2 = j / gcd;
//                uniqueAngles.add(d1*1000000 + d2);
                visited[d1][d2] = true;
            }
        }

//        System.out.println(uniqueAngles.size());
        int cnt = 0;
        for (int i = 1; i <= D2; i++) {
            for (int j = 1; j <= i; j++) {
                if (visited[i][j]) {
                    cnt++;
                }
            }
        }
        System.out.println(cnt);
    }

    static int gcd(int a, int b) { // 최대공약수
        // 재귀
        if (b == 0) {
            return a;
        } else {
            return gcd(b, a % b);
        }
    }
}