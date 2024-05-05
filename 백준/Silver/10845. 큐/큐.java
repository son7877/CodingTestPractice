import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Queue;

public class Main {
    static Queue<Integer> queue = new LinkedList<>();
    static int last;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());

        for(int i=0;i<num;i++){
            String str = br.readLine();
            if(str.contains("push")){
                String [] pushstr = str.split(" ");
                push(Integer.parseInt(pushstr[1]));
            }
            else if (str.equals("front")) front();
            else if (str.equals("back")) back();
            else if (str.equals("pop")) pop();
            else if (str.equals("size")) size();
            else if (str.equals("empty")) empty();
        }
    }
    public static void push(int n){
        last = n;
        queue.add(n);
    }
    public static void pop(){
        if(queue.isEmpty()) System.out.println(-1);
        else System.out.println(queue.poll());
    }
    public static void front(){
        if(queue.isEmpty()) System.out.println(-1);
        else System.out.println(queue.peek());
    }
    public static void back(){
        if(queue.isEmpty()) System.out.println(-1);
        else System.out.println(last);
    }
    public static void size(){
        System.out.println(queue.size());
    }
    public static void empty(){
        if(queue.isEmpty()) System.out.println(1);
        else System.out.println(0);
    }
}
