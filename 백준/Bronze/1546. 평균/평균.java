import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        String [] str = br.readLine().split(" ");
        double [] score = new double[num];
        for(int i=0;i<num;i++){
            score[i]=Double.parseDouble(str[i]);
        }
        Arrays.sort(score);
        double sum=0;
        for(int i=0;i<num;i++){
            score[i]=score[i]/score[score.length-1]*100;
        }
        for(int i=0;i<num;i++){
            sum+=score[i];
        }
        System.out.println(sum/num);        
    }
}
