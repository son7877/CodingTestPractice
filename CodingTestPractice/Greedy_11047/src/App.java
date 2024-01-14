import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int coin = sc.nextInt();
        int money = sc.nextInt();
        int A [] = new int[coin];
        for(int i=0;i<coin;i++){
            A[i] = sc.nextInt();
        }
        int count = 0;
        int i = coin - 1;

        while(money>=0){
            if(A[i]>money){
                i--;
            }
            else{
                count += (money/A[i]);
                money = money%A[i];
                i--;
            }
            if(i<0) break;
        }
        System.out.println(count);

    }
}
