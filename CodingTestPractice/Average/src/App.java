import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int Subject = sc.nextInt();
        int Score [] = new int[Subject];
        
        for(int i=0;i<Score.length;i++){
            Score[i] = sc.nextInt();
        }

        long max =0;
        long sum =0;
        for(int j=0;j<Score.length;j++){
            if(Score[j]>max) 
                max = Score[j];
            sum += Score[j];
        }
        System.out.println(sum/max*100/Subject);
    }
}
