import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        //숫자를 각 자릿수별로 나누기(substring() 함수 사용)
        Scanner sc = new Scanner(System.in);
        String S = sc.next();
        int A [] = new int[S.length()];
        for(int i = 0; i<S.length() ; i++){
            A[i]= Integer.parseInt(S.substring(i, i+1));
        }
        //선택정렬
        for(int i = 0; i<S.length(); i++){
            int Max = i;
            for(int j = i+1; j<S.length(); j++){
                if(A[Max]<A[j]){
                    Max = j;
                }
            }
            if(A[i]<A[Max]){
                int temp = A[i];
                A[i] = A[Max];
                A[Max] = temp;
            }

        }
        for(int i =0 ; i<S.length();i++){
            System.out.print(A[i]);
        }
    }
}
