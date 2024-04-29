import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());

        for(int i=0;i<num;i++){
            Stack<Character> stack = new Stack<>();
            String str = br.readLine();
            char [] c = str.toCharArray();
            for(int j=0;j<c.length;j++){
                if(c[j]==')') {
                    if(stack.isEmpty()){
                        stack.push(c[j]);
                        break;
                    }else{
                        stack.push(c[j]);
                        stack.pop();
                        stack.pop();
                    }
                }else{
                    stack.push(c[j]);
                }
            }
            if(stack.isEmpty()) System.out.println("YES");
            else System.out.println("NO");
        }
    }
}
