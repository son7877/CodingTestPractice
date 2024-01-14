import java.util.Arrays;
import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int A [] = new int[N];
        for(int i =0;i<N;i++){
            A[i] = sc.nextInt();
        }
        Arrays.sort(A);
        int M = sc.nextInt();
        for(int i=0;i<M;i++){
            boolean find =false;
            int target = sc.nextInt();
            int start = 0;
            int end = A.length -1;
            while(start <= end){
                int mid = (start+end)/2; // 중앙 값의 인덱스 설정
                int mid_value = A[mid]; // 중앙값
                if(target>mid_value){ // 목표값이 중앙값보다 클 경우
                    // 시작 인덱스를 중앙값 인덱스의 오른쪽으로 이동
                    start = mid+1;
                }else if (target<mid_value){ //목표값이 중앙값보다 작을 경우
                    // 끝 인덱스를 중앙값 인덱스의 왼쪽으로 이동
                    end = mid -1;
                }else{
                    find = true;
                    break;
                }
            }
            if (find == true) {
                System.out.println(1);
            } else {
                System.out.println(0);
            }

        }

    }

}
