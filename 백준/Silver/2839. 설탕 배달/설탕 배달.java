import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int sugar = Integer.parseInt(br.readLine());
        int count =0;
         while(true){
             if(sugar%5==0){
                 System.out.println(sugar/5+count);
                 break;
             } else if (sugar<0) {
                 System.out.println(-1);
                 break;
             }
             sugar -= 3;
             count++;
         }


    }
}
