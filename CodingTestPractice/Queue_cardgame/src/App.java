import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.Stack;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        // 큐 생성
        Queue<Integer> mQueue = new LinkedList<>();
        Stack<Integer> stack = new Stack<>();
        stack.push(2);
        stack.pop();
        int N = sc.nextInt();
        for(int i=1;i<=N;i++){
            mQueue.add(i);
        }

        while(mQueue.size()>1){
            mQueue.poll();
            mQueue.add(mQueue.poll());
        }

        System.out.println(mQueue.poll());
    }
}
