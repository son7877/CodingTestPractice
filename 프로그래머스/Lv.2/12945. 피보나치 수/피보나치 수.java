class Solution {
    static int num [] = new int [100001];
    public int solution(int n) {
        int answer = 0;
        answer = fibonacci(n);
        return answer;
    }
    public static int fibonacci(int m){
        if (m <= 1) {
            return m % 1234567;
        }
        if(num[m]!=0){
            return num[m] %1234567;
        } 
        num[m]=(fibonacci(m-2)+fibonacci(m-1))%1234567;
        return num[m]%1234567;
    }
}
