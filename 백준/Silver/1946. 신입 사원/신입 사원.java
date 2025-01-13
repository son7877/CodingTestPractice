import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int testCase = Integer.parseInt(br.readLine());

        for (int i = 0 ; i<testCase; i++){
            int N = Integer.parseInt(br.readLine());
            int[][] rank = new int[N][2];

            for (int j = 0; j<N; j++){
                String[] input = br.readLine().split(" ");
                rank[j][0] = Integer.parseInt(input[0]);
                rank[j][1] = Integer.parseInt(input[1]);
            }

            Arrays.sort(rank, (o1, o2) -> o1[0] - o2[0]);

            int count = 1;
            int min = rank[0][1];

            for (int j = 1; j<N; j++){
                if (rank[j][1] < min){
                    count++;
                    min = rank[j][1];
                }
            }

            System.out.println(count);
        }
    }
}
