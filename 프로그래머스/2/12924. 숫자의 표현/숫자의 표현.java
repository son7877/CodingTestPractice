class Solution {
    public int solution(int n) {
        int answer = 1;
        int i=1;
        while(i<=n){
            int sum =0;
            for(int j=i;j<=n;j++){
                if(sum==n){
                    answer++;
                    break;
                }
                else if (sum>n){
                    break;
                }
                sum += j;
            }
            i++;
        }
        return answer;
    }
}