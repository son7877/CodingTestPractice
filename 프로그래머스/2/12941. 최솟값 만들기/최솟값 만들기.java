import java.util.Arrays;
import java.util.Collections;

class Solution {
    public int solution(int[] A, int[] B) {
        int answer = 0;
        int [] sum = new int [A.length];
        Arrays.sort(A);
        Arrays.sort(B);

        for(int i=0;i<A.length;i++){
            sum[i]=A[i]*B[B.length-1-i];
        }

        for(int i=0;i<sum.length;i++){
            answer += sum[i];
        }

        return answer;
    }
}