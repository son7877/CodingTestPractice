import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.PriorityQueue;

public class App {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine()); // 연산 횟수

        // 우선순위 큐 설정
        PriorityQueue<Integer> mQueue = new PriorityQueue<>((p1,p2)->{
            //절대값 작은 값 우선
            int first_abs = Math.abs(p1);
            int second_abs = Math.abs(p2);
            //절대값 같을 시 음수 우선
            if(first_abs == second_abs){
                return p1 > p2 ? 1 : -1;
            }
            return first_abs - second_abs;
        });
        
        for( int i =0 ; i<N ; i++ ){
            int request = Integer.parseInt(br.readLine());
            if(request == 0){
                if(mQueue.isEmpty()){
                    System.out.println("0");
                }
                else{
                    System.out.println(mQueue.poll());
                }
            }
            else{
                mQueue.add(request);
            }

        }
        


    }
}
