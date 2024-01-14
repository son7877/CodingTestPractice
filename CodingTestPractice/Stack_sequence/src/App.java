import java.util.Scanner;
import java.util.Stack;

public class App {
    public static void main(String[] args) throws Exception {
        // 스택->오름차순 수열
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int sequence [] = new int[n];
        for(int i=0; i<n; i++){
            sequence[i]= sc.nextInt();
        }
        Stack<Integer> stack = new Stack<>();
        int num = 1; // 오름차순 자연수
        boolean result = true;
        StringBuffer bf = new StringBuffer(); // 출력할 부호값
        for(int i=0; i<sequence.length;i++){
            int su = sequence[i]; // 수열 값
            if(su >= num){
                while(su>=num){
                    stack.push(num++);
                    bf.append("+\n");
                }
                stack.pop();
                bf.append("-\n");
            }
            else{
                int n_pop = stack.pop();
                if(n_pop>su){
                    System.out.println("NO");
                    result = false;
                    break;
                }
                else{
                    bf.append("-\n");
                }

            }
        }
        // 괄호 구분!!! //
        if (result)
            System.out.println(bf.toString());
    }
}
