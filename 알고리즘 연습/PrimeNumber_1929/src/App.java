import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int M = sc.nextInt();
        int N = sc.nextInt();
        int A [] = new int[N+1];
        for(int i=2;i<N+1;i++){
            A[i]=i;
        }
        /*
         * 제곱근-> N의 제곱근보다 작은 약수만 확인하면 소수 판별 가능
         * ex) sqrt(24)=4.xxxx -> 4이하의 약수 확인
         */
        for(int i=2;i<Math.sqrt(N);i++){
            if(A[i]==0){
                continue;
            }
            for(int j=i+i;j<N+1;j+=i){ // 배수 지우기
                A[j]=0;
            }
        }
        for(int i=M;i<=N;i++){
            if(A[i]!=0){
                System.out.println(A[i]);
            }
        }


    }
}
