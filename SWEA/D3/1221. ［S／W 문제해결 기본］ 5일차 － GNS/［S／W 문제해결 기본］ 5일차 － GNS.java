import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T;
        T=sc.nextInt();
        sc.nextLine();

        for (int test_case = 1; test_case <= T; test_case++) {
            String[] input = sc.nextLine().trim().split(" ");
            int length = Integer.parseInt(input[1]);
            String[] arr = sc.nextLine().trim().split(" ");

            String[] secret = {"ZRO", "ONE", "TWO", "THR", "FOR", "FIV", "SIX", "SVN", "EGT", "NIN"};
            Dictionary<String, Integer> dict = new Hashtable<>();
            Dictionary<Integer, String> dict2 = new Hashtable<>();

            for(int i = 0; i < secret.length; i++){
                dict.put(secret[i], i);
                dict2.put(i,secret[i]);
            }

            int[] num = new int[arr.length];

            for(int i = 0; i < arr.length; i++){
                num[i] = dict.get(arr[i]);
            }

            Arrays.sort(num);


            System.out.println("#"+test_case);
            for(int i = 0; i < num.length; i++){
                System.out.print(dict2.get(num[i]) + " ");
            }
        }
    }
}
