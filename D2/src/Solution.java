import java.util.Arrays;
import java.util.Scanner;


public class Solution {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        for (int test_case = 1; test_case <= T; test_case++) {
            int N = sc.nextInt();
            int M [] = new int [N];
            for(int i=0;i<N;i++){
                M[i]=Math.abs(sc.nextInt());
            }
            Arrays.sort(M);
            int count =1;
            for(int i=1;i<N;i++){
                if(M[0]==M[i]){
                    count++;
                }else{
                    break;
                }
            }
            System.out.println("#"+test_case+" "+M[0]+" "+count);
            



            

        }
    }

}


