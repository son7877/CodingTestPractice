import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String num = br.readLine();
        int n = Integer.parseInt(num);
        System.out.println(cal(n));        
    }
    public static int cal (int n){
        int answer = 0;
        for(int i=0;i<n;i++){
            String str = Integer.toString(i);
            char [] c =str.toCharArray();
            int [] N = new int[c.length];
            int sum = 0;
            for(int j=0;j<c.length;j++){
                N[j]=c[j]-'0';
                sum +=N[j];
            }
            if(n==(sum+i)){
                answer=i;
                break;
            }else{
                continue;
            }
        }
        return answer;

    }

}
