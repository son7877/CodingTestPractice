import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int Num = sc.nextInt();
        String sNum = sc.next();
        char[] cNum = sNum.toCharArray();
        int sum = 0;
        for (int i = 0; i < cNum.length; i++) {
            sum += cNum[i] - '0';
        }
        System.out.println(sum);
    }
}