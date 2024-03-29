import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = Integer.parseInt(sc.nextLine());
        int bee = 1;
        int count =1;
        while(true){
            if(bee>=num) break;
            bee += count*6;
            count++;
        }
        System.out.println(count);
    }
}