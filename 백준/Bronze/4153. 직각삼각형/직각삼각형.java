import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        while(true){
            String [] str = br.readLine().split(" ");
            int [] triangle = new int[3];
            for(int i=0;i<str.length;i++){
                triangle[i]=Integer.parseInt(str[i]);
            }
            if(triangle[0]==0 && triangle[0]==0 && triangle[0]==0){
                break;
            }else{
                Arrays.sort(triangle);
                if(triangle[triangle.length-1]*triangle[triangle.length-1]
                ==triangle[0]*triangle[0]+triangle[1]*triangle[1]){
                    System.out.println("right");
                }else{
                    System.out.println("wrong");
                }
            }


        }
        
            
    }
}
