import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for(int test_case = 1; test_case <= T; test_case++){
            int length = sc.nextInt();
            sc.nextLine();

            char[][] arr = new char[8][8];

            for(int i = 0; i < 8; i++){
                String line = sc.nextLine();
                arr[i] = line.toCharArray();
            }

            int answer = palindrome(arr, length);

            System.out.println("#"+test_case+" "+answer);
        }
    }

    private static int palindrome(char[][] arr, int length){
        int count = 0;

        // 가로 방향
        for(int i = 0; i < 8; i++) {
            for(int j = 0; j <= 8 - length; j++){
                boolean isPalindrome = true;
                for(int k = 0; k < length; k++) {
                    if(arr[i][j + k] != arr[i][j + length - 1 - k]){
                        isPalindrome = false;
                        break;
                    }
                }
                if(isPalindrome) count++;
            }
        }
        
        // 세로 방향
         for(int i = 0; i <= 8 - length; i++) {
            for(int j = 0; j < 8; j++){
                boolean isPalindrome = true;
                for(int k = 0; k < length; k++) {
                    if(arr[i + k][j] != arr[i + length - 1 - k][j]) {
                        isPalindrome = false;
                        break;
                    }
                }
                if(isPalindrome) count++;
            }
        }
        
        return count;
    }
}
