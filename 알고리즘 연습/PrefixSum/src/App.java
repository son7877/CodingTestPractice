import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class App {
    public static void main(String[] args) throws Exception {
        //입력개수 10만개 이상
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer stringTokenizer = new StringTokenizer(bufferedReader.readLine());
        int N = Integer.parseInt(stringTokenizer.nextToken());
        int Q = Integer.parseInt(stringTokenizer.nextToken());
        long S [] = new long[N+1]; //0번째 인덱스를 무시하고 계산하기 위함
        
        stringTokenizer = new StringTokenizer(bufferedReader.readLine());
        for(int i =1 ; i<=N;i++){
            S[i] = S[i-1] + Integer.parseInt(stringTokenizer.nextToken());
        }
        for(int q=0; q<Q; q++){
            stringTokenizer = new StringTokenizer(bufferedReader.readLine());
            int start = Integer.parseInt(stringTokenizer.nextToken());
            int end = Integer.parseInt(stringTokenizer.nextToken());
            System.out.println(S[end]-S[start-1]);
        }    




    }
}
