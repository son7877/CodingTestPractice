import java.util.ArrayList;
import java.util.Scanner;
public class Main {
    static final int M = 1234567891;
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int [] num = new int [2];
        for(int i=0;i<num.length;i++){
            num[i] = sc.nextInt();
        }
        division(num[0],num[1]);
    }
    private static void division(int n, int m){
        ArrayList<Integer> gcd = new ArrayList<>();
        for(int i=2;i<=Math.min(n,m);i++){
            while(n%i==0 && m%i==0){
                gcd.add(i);
                n /= i;
                m /= i;
            }
        }
        int answer =1;
        for(int i=0;i<gcd.size();i++){
            answer *= gcd.get(i);
        }
        System.out.println(answer);
        System.out.println(answer*n*m);

    }
}
