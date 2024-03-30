import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String [] input = sc.nextLine().split(" ");
        Integer [] card = new Integer[Integer.parseInt(input[0])];
        for(int i=0;i<card.length;i++) {
            card[i] = sc.nextInt();
        }
        Arrays.sort(card, Collections.reverseOrder());
        int i=0; int j=1; int k=2;
        Integer answer = 0;
        while(true){
            Integer sum = card[i]+card[j]+card[k];
            if(sum <= Integer.parseInt(input[1])) {
                if(answer < sum){
                    answer = sum;
                }
            }
            if(i==card.length-3) {
                System.out.println(answer);
                break;
            }
            else{
                if(k==card.length-1){
                    if(j==card.length-2){
                        i++;
                        j=i+1;
                        k=j+1;
                    }else{
                        j++;
                        k=j+1;
                    }
                }else k++;
            }
        }
    }
}