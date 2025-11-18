import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int T = 10;

        for(int test_case = 1; test_case <= T; test_case++){
            String[] input = sc.nextLine().trim().split(" ");

            int length = Integer.parseInt(input[0]);
            String str = input[1];

            System.out.println("#"+test_case+" "+password(str));
        }
    }

    private static String password(String str){
        Stack<Character> stack = new Stack<>();
        
        for(int i=0;i<str.length();i++){
            char c = str.charAt(i);
            if(!stack.isEmpty() && stack.peek() == c) {
                stack.pop();
            } else {
                stack.push(c);
            }
        }
        
        StringBuilder result = new StringBuilder();
        for(char c: stack){
            result.append(c);
        }
        
        return result.toString();
    }
}
