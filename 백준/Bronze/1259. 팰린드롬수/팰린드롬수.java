import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        while(true){
            String answer = "yes";
            String arr = br.readLine();
            if(arr.equals("0")){
                break;
            }
            for(int i=0;i<arr.length()/2;i++){
                if(arr.charAt(i)!=arr.charAt(arr.length()-1-i)){
                    answer = "no";
                }
            }
            System.out.println(answer);
        }
        
    }
}
