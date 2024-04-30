import java.awt.image.AreaAveragingScaleFilter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        int [] arr = new int[num];
        String [] str = br.readLine().split(" ");
        int [] dp = new int[num];
        for(int i=0;i<num;i++){
            arr[i] = Integer.parseInt(str[i]);
            dp[i] =1;
            for(int j=0;j<i;j++){
                if(arr[i]>arr[j]){
                    dp[i] = Math.max(dp[i],dp[j]+1);
                }
            }
        }
        int max =0;
        for(int a:dp){
            max= Math.max(max,a);
        }
        System.out.println(max);







    }
}
