import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class Main {
    static Stack<Integer> stack;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());
        stack = new Stack<>();
        for(int i=0;i<num;i++){
            String str = br.readLine();
            if(str.contains("push")){
                String [] pushStr = str.split(" ");
                push(Integer.parseInt(pushStr[1]));
            }
            else if(str.equals("pop")) pop();
            else if (str.equals("size")) size();
            else if (str.equals("empty")) empty();
            else if (str.equals("top")) top();
        }
    }
    public static void push(int n){
        stack.push(n);
    }
    public static void pop(){
        if(stack.isEmpty()) System.out.println(-1);
        else System.out.println(stack.pop());
    }
    public static void size(){
        System.out.println(stack.size());
    }
    public static void empty(){
        if(stack.isEmpty()) System.out.println(1);
        else System.out.println(0);
    }
    public static void top(){
        if(stack.isEmpty()) System.out.println(-1);
        else {
            System.out.println(stack.peek());
        }
    }
}
