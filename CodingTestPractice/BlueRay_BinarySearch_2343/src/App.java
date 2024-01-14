import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int Lesson = sc.nextInt();
        int BlueRay = sc.nextInt();
        int A [] = new int[Lesson];
        int start = 0;
        int end = 0;
        for(int i =0;i<A.length;i++){
            A[i]=sc.nextInt();
            
            if(start < A[i]){
                start = A[i];
            }
            end = end+A[i];
       }
       while(start<=end){
        int mid = (start+end)/2;
        int num = 0; // 사용 개수
        int sum = 0; // 레슨 합
        for(int i =0 ;i<Lesson;i++){
            if(sum + A[i]>mid){
                num++;
                sum=0;
            }
            sum = sum + A[i];
        }
        if(sum!=0){
            num++;
        }
        if(num<=BlueRay) 
            end = mid-1;
        else 
            start = mid +1;
       }
       System.out.println(start);

    }
}
