import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String [] str = br.readLine().split(" ");
        int [] num = new int[str.length];
        for(int i=0;i<str.length;i++){
            num[i]=Integer.parseInt(str[i]);
        }
        int [][] dp = new int[num[0]+1][num[0]+1];

        dp[1][0] = 1;
        dp[1][1] = 1;
        
        for(int i=2;i<dp.length;i++){
            dp[i][0] =1;
            for(int j=1;j<dp[i].length;j++){
                dp[i][j]=dp[i-1][j-1]+dp[i-1][j];
            }
        }
        System.out.println(dp[num[0]][num[1]]);
    }
}
