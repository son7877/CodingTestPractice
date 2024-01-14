import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        //수의 범위 10^14
        Scanner sc = new Scanner(System.in);
        long min = sc.nextLong();
        long max = sc.nextLong();
        //소수의 제곰->수의 범위의 제곱근내에 해당하는 소수 구하기
        long A [] = new long[10000001];
        for(int i=2;i<A.length;i++){
            A[i]=i;
        }
        for(int i=2;i<Math.sqrt(A.length);i++){
            if(A[i]==0){
                continue;
            }
            for(int j=i+i;j<A.length;j+=i){
                A[j]=0;
            }
        }
        int count=0;
        for(int i=2;i<10000001;i++){
            if(A[i]!=0){
                long temp=A[i];
                while((double)A[i]<=(double)max/(double)temp){            
                    if((double)A[i]>=(double)min/(double)temp){
                        count++;
                    }
                    temp *= A[i];
                }
            }
        }    
        System.out.println(count);

    }
}
