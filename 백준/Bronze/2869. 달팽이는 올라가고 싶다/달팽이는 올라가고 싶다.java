import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br= new BufferedReader(new InputStreamReader(System.in));
        String [] str = br.readLine().split(" ");
        long [] n = new long[str.length];

        for(int i=0;i<str.length;i++) {
            n[i] = Integer.parseInt(str[i]);
        }

        double answer =  ((double)(n[2]-n[1])/(double)(n[0]-n[1]));
        System.out.println((int)Math.ceil(answer));
    }
}
