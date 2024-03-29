
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = Integer.parseInt(sc.nextLine());
        String [] arr = sc.nextLine().split(" ");
        int answerArr [] = new int[num];
        int answer =0;
        for(int i=0;i<num;i++){
            answerArr[i]=Integer.parseInt(arr[i]);
            if(isPrime(answerArr[i])) answer++;
        }

        System.out.println(answer);
    }
    public static boolean isPrime(int n){
        int count =0;
        for(int i=1;i<=n;i++){
            if(n%i==0) count++;
        }
        if(count == 2) return true;
        else return false;
    }
}
