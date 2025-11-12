import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for(int test_case=1;test_case<=T;test_case++){
            int number = sc.nextInt();
            sc.nextLine();
            int[] arr = Arrays.stream(sc.nextLine().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();

            Deque<Integer> queue = new ArrayDeque<>();

            for(int num: arr){
                queue.add(num);
            }

            while(true) {
                for(int i=1;i<=5;i++){
                    if(queue.peekFirst()-i <= 0){
                        queue.removeFirst();
                        queue.add(0);
                        break;
                    } else {
                        queue.add(queue.removeFirst()-i);
                    }
                }

                if (queue.peekLast() == 0){
                    break;
                }
            }

            System.out.print("#"+number+" ");
            for(int i=0;i<8;i++){
                System.out.print(queue.peek()+" ");
                queue.removeFirst();
            }
            System.out.println();
        }
    }
}
