import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        for(int i=0;i<num;i++){
            int k = Integer.parseInt(br.readLine());
            int n = Integer.parseInt(br.readLine());
            int dp [][] = new int[k+1][n+1];
            for(int j=1;j<=n;j++){
                dp[0][j]=j;
            }

            for(int j=1;j<=k;j++){
                dp[j][1] =1;
                for(int l=2;l<=n;l++){
                    dp[j][l] = dp[j][l-1]+dp[j-1][l];
                }
            }
            System.out.println(dp[k][n]);
        }
    }
}
