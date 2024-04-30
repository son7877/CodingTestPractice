import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    static int [][] dp =new int[30][30];
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        for(int i=0;i<num ;i++){
            String [] str = br.readLine().split(" ");
            int [] n = new int[str.length];
            for(int j=0;j<2;j++){
                n[j] = Integer.parseInt(str[j]);
            }
//            long mul =1;
//            long mul2 =1;
//            for(int k=0;k<n[0];k++){
//                mul *= n[1]-k;
//            }
//
//            for(int l=0;l<n[0];l++){
//                mul2 *= n[0]-l;
//            }
            System.out.println(combi(n[1],n[0]));
        }
    }
    public static int combi(int n,int m){
        if(n==m||m==0) return dp[n][m]=1;
        if(dp[n][m]!=0) return dp[n][m];
        return dp[n][m] = combi(n-1,m-1)+combi(n-1,m);
    }
}
