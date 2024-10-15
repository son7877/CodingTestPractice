import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        
        int M = Integer.parseInt(br.readLine());
        int S = 0;
        
        while (M-- > 0) {
            String[] input = br.readLine().split(" ");
            String cmd = input[0];
            
            if (cmd.equals("add")) {
                int x = Integer.parseInt(input[1]);
                S |= (1 << x);
            } else if (cmd.equals("remove")) {
                int x = Integer.parseInt(input[1]);
                S &= ~(1 << x);
            } else if (cmd.equals("check")) {
                int x = Integer.parseInt(input[1]);
                bw.write(((S & (1 << x)) > 0 ? 1 : 0) + "\n");
            } else if (cmd.equals("toggle")) {
                int x = Integer.parseInt(input[1]);
                S ^= (1 << x);
            } else if (cmd.equals("all")) {
                S = (1 << 21) - 1;
            } else if (cmd.equals("empty")) {
                S = 0;
            }
        }
        
        bw.flush();
        bw.close();
    }
}
