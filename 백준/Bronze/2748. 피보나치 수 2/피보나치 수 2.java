import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        long [] pibo = new long[n+1];

        if(n==0) pibo[0]=0;
        
        else{
            pibo[0]=0;
            pibo[1]=1;
            for(int i=2;i<=n;i++){
                pibo[i]=pibo[i-2]+pibo[i-1];
            }
        }
        System.out.println(pibo[n]);
    }
}
