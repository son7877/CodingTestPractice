import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for(int test_case = 1; test_case <=10; test_case++){
            int N = sc.nextInt();
            sc.nextLine();
            int[] secret = Arrays.stream(sc.nextLine().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();

            int M = sc.nextInt();
            sc.nextLine(); 
            String[] input = sc.nextLine().trim().split(" ");

            ArrayList<Integer> arr = new ArrayList<>();

            for(int number: secret) {
                arr.add(number);
            }

            int idx = 0;
            while(idx < input.length) {
                if(input[idx].equals("I")) {
                    int x = Integer.parseInt(input[idx + 1]); // 삽입 위치
                    int y = Integer.parseInt(input[idx + 2]); // 삽입할 숫자 개수
                    for(int i = 0; i < y; i++) {
                        int s = Integer.parseInt(input[idx + 3 + i]);
                        arr.add(x + i, s);
                    }
                    idx += 3 + y;
                } else {
                    idx++;
                }
            }

            System.out.print("#"+test_case+" ");
            for(int i=0;i<10;i++){
                System.out.print(arr.get(i)+" ");
            }
            System.out.println();
        }
    }
}