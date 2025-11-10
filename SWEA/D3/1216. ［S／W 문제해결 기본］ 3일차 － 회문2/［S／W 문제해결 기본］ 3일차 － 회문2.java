import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for(int test_case = 1; test_case <= T; test_case++){
            int t = sc.nextInt();
            sc.nextLine();

            char[][] arr = new char[100][100];

            for(int i = 0; i < 100; i++){
                String line = sc.nextLine();
                arr[i] = line.toCharArray();
            }

            int answer = palindrome(arr);

            System.out.println("#"+t+" "+answer);
        }
    }

    private static int palindrome(char[][] arr){
        int answer = 1;  // 최소 길이는 1
        
        // 가로 방향
        for(int i = 0; i < 100; i++) {
            for(int length = 100; length > answer; length--) {  
                for(int j = 0; j <= 100 - length; j++){
                    boolean isPalindrome = true;
                    for(int k = 0; k < length / 2; k++) {
                        if(arr[i][j + k] != arr[i][j + length - 1 - k]){
                            isPalindrome = false;
                            break;
                        }
                    }
                    if(isPalindrome){
                        answer = length;
                        break;
                    }
                }
                if(answer == length) break; 
            }
        }
    
        // 세로 방향
        for(int j = 0; j < 100; j++) {
            for(int length = 100; length > answer; length--) {  
                for(int i = 0; i <= 100 - length; i++){
                    boolean isPalindrome = true;
                    for(int k = 0; k < length / 2; k++) {
                        if(arr[i + k][j] != arr[i + length - 1 - k][j]){
                            isPalindrome = false;
                            break;
                        }
                    }
                    if(isPalindrome){
                        answer = length;
                        break;
                    }
                }
                if(answer == length) break;  
            }
        }
    
        return answer;
    }
}
