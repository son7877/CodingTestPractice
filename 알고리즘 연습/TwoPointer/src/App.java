import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int count = 1;
        int end = 1;
        int start= 1;
        int sum = 1; //sum=0 으로하면 값 1 고정
        while(end != N){ 
            if(sum == N){
                count++;
                end++;
                sum = sum+end;
            }
            else if(sum<N){
                end++;
                sum = sum+end;
            }
            else if(sum>N){
                sum = sum-start;
                start++;
            }
                
        }
        System.out.println(count);
    }
}
