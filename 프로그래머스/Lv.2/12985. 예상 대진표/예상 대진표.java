import java.util.*;
class Solution
{
    public int solution(int n, int a, int b)
    {
        int answer = 0;
        
        while(true){
            answer++;
            a = a/2+a%2;
            b = b/2+b%2;
            if(a==b)
                break;
        }
        // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
        

        return answer;
    }
}