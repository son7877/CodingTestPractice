import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int num [] = new int[3];
        Integer multi = 1;
        for(int i=0;i<num.length;i++){
            num[i]=sc.nextInt();
        }
        for(int i=0;i<num.length;i++){
            multi *= num[i];
        }
        char [] answer = multi.toString().toCharArray();
        
        for(int i =0;i<10;i++){
            int count = 0;
            for(int j=0;j<answer.length;j++){
                if(answer[j]- '0' == i) count++;
            }
            System.out.println(count);
        }



    }
}
