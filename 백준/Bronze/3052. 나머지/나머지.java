
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int num [] =new int[10];
        for(int i=0;i<num.length;i++){
            num[i]=sc.nextInt();
        }
        Set<Integer> answer = new HashSet<>();
        for(int i=0;i<num.length;i++){
            answer.add(num[i]%42);
        }

        System.out.println(answer.size());
    }
}
