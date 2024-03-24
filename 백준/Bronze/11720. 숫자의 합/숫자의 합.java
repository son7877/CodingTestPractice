import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        String arr = br.readLine();
        int answer [] = new int[arr.length()];
        for(int i=0;i<arr.length();i++){
            answer[i]=arr.charAt(i)-'0';
        }
        int sum =0;
        for(int i=0;i<answer.length;i++){
            sum+=answer[i];
        }

        System.out.println(sum);
        
    }
}
