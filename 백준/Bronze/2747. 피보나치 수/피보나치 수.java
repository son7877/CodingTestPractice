import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws IOException {
        /*
            피보나치
            0,1,1,2,3,5 .....
         */
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        ArrayList<Integer> arr = new ArrayList<>();
        arr.add(0);
        arr.add(1);
        for(int i=2;i<=n;i++){
            arr.add(arr.get(i-2)+arr.get(i-1));
        }
        
        System.out.println(arr.get(n));

    }

}
