import java.util.Collections;
import java.util.PriorityQueue;

class Solution {
    public long solution(int n, int[] works) {
        long answer = 0;
        PriorityQueue<Integer> queue = new PriorityQueue<>(Collections.reverseOrder());
        for(int i =0;i<works.length;i++){
            queue.offer(works[i]);
        }
        while(n>0){
            int num = queue.poll();
            if(num==0){
                answer =0;
                break;
            }
            num--;
            queue.offer(num);
            n--;
        }
        
        for(int num : queue){
            answer += Math.pow(num, 2);
        }

        return answer;
    }
}