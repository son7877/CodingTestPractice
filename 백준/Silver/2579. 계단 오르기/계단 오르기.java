import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int number = Integer.parseInt(br.readLine());
        long[] stair = new long[number];
        for(int i = 0; i < number; i++) {
            stair[i] = Long.parseLong(br.readLine());
        }

        if (number == 1) {
            System.out.println(stair[0]);
            return;
        }

        long[] dp = new long[number];
        dp[0] = stair[0];
        if (number > 1) {
            dp[1] = stair[0] + stair[1];
        }
        if (number > 2) {
            dp[2] = Math.max(stair[1] + stair[2], stair[0] + stair[2]);
        }

        for(int i = 3; i < number; i++) {
            dp[i] = Math.max(dp[i-3] + stair[i-1] + stair[i], dp[i-2] + stair[i]);
        }

        System.out.println(dp[number-1]);
    }
}
