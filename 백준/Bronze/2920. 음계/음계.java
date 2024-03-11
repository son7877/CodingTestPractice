import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws IOException {
        Scanner sc= new Scanner(System.in);
        int num [] = new int [8];
        for(int i=0;i<num.length;i++){
            num[i] = sc.nextInt();
        }
        int count =0;
        for(int i=0;i<num.length-1;i++){
            if(num[i]==num[i+1]-1) count++;
        }
        for(int i=0;i<num.length-1;i++){
            if(num[i]==num[i+1]+1) count--;
        }
        if (count == 7) System.out.println("ascending");
        else if(count== -7) System.out.println("descending");
        else System.out.println("mixed");

    }
}