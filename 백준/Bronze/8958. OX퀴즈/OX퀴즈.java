
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.nextLine());
        for(int i=0;i<n;i++){
            String str = sc.nextLine();
            char c [] =str.toCharArray();
            int count =0;
            int total = 0;
            for(int j=0;j<str.length();j++){
                if(c[j]=='O') {
                    count++;
                    total += sum(count);
                }else{
                    count =0;
                }
            }
            System.out.println(total);
        }
    }
    public static int sum(int count){
        int sum =0;
        for(int i=1;i<=count;i++){
            sum += 1;
        }
        return sum;
    }
}
