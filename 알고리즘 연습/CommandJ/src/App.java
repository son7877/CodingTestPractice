import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
// import java.util.Collections;
import java.util.StringTokenizer;

public class App {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        int M = Integer.parseInt(br.readLine());
        int num [] = new int[N];
        StringTokenizer st = new StringTokenizer(br.readLine());
        //배열 저장
        for(int i =0; i<N; i++){
            num[i] = Integer.parseInt(st.nextToken());
        }
        // 오름차순 정럴 후 번호 합 생각하기 (투 포인터 방식)
        // *내림차순 정렬* Arrays.sort(num, Collections.reverseOrder());
        Arrays.sort(num);
        
        int count = 0;
        int i = 0 ;
        int j = N-1;
        while(i<j){
            if(num[i]+num[j]<M) i++;
            else if (num[i]+num[j]>M) j--;
            else if (num[i]+num[j]==M){
                count ++;
                i++;
                j--;
            }
        }
        System.out.println(count);
        
    }
}
