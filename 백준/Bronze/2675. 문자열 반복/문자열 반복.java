
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int testCase = Integer.parseInt(sc.nextLine());
        int num [] = new int[testCase];
        String str [] =  new String[testCase];

        for (int i = 0; i < testCase; i++) {
            String str2 [] = sc.nextLine().split(" ");
            num[i] = Integer.parseInt(str2[0]);
            str[i] = str2[1];
        }

        for (int i = 0; i < testCase; i++) {
            char c [] = str[i].toCharArray();
            for(int k=0;k<str[i].length();k++){
                for(int j=0;j <num[i] ;j++) {
                    System.out.print(c[k]);
                }
            }
            System.out.println();
        }



    }
}
