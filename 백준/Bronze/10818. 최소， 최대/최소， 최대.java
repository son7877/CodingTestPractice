import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        String [] arr = br.readLine().split(" ");
        int [] answer = new int[num];
        for(int i=0;i<arr.length;i++){
            answer[i]=Integer.parseInt(arr[i]);
        }
        Arrays.sort(answer);
        System.out.println(answer[0]+" "+answer[answer.length-1]);
    }
}
