import java.util.Scanner;

public class Solution {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();

        for (int test_case = 1; test_case <= T; test_case++) {
            int N = sc.nextInt();
            int A [] = new int[N];
            for(int i=0;i<N;i++){
                A[i]=sc.nextInt();
            }            
            int max =A[N-1];
            long money=0;
            for(int i=N-2;i>=0;i--){
                if(A[i]<max){
                    money += (max - A[i]);
                }else {
                    max=A[i];
                }
            }
            System.out.println("#"+test_case+" "+money);
        }
    }
}