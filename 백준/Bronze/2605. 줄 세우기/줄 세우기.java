
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        /*
         * 1 2 3 4 5
         * 0,1,1,3,2
         * 4 2 5 3 1
         * 
         * 00001 0
         * 00021 1
         * 00231 1
         * 04231 3
         * 42531 2
         */
        Scanner sc = new Scanner(System.in);
        String n = sc.nextLine();

        int arr[] = new int[Integer.parseInt(n)];
        int inputArr[] = new int[Integer.parseInt(n)];

        ArrayList<Integer> answer = new ArrayList<>();

        for (int i = 0; i < inputArr.length; i++) {
            arr[i] = i + 1;
        }
        for (int i = 0; i < inputArr.length; i++) {
            inputArr[i] = sc.nextInt();
        }

        for (int i = 0; i < inputArr.length; i++) {
            if (inputArr[i] == 0) { // 0을 뽑을 때
                answer.add(arr[i]);
            } else {
                answer.add(answer.size() - inputArr[i], arr[i]);
            }
        }

        for (int i = 0; i < answer.size(); i++) {
            System.out.print(answer.get(i) + " ");
        }

    }

}
