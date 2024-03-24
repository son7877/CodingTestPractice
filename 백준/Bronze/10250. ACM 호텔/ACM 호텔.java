import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Integer test_case = Integer.parseInt(br.readLine());

        for(int i=0;i<test_case;i++){
            String [] list = br.readLine().split(" ");
            Integer height = Integer.parseInt(list[0]);
            Integer weight = Integer.parseInt(list[1]);
            Integer num = Integer.parseInt(list[2]);
        
            // int [][] hotel = new int[weight][height];

            Integer n = num/height; //호수
            Integer m = num%height; //층수
            
            String answer ="";
            if(m==0){
                answer = Integer.toString(height*100+n);
            }else{
                answer = Integer.toString(m*100+(n+1));
            }
            System.out.println(answer);

        }
        br.close();


    }
}
