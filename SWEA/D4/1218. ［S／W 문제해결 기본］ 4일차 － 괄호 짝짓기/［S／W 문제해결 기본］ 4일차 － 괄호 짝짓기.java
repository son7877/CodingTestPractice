import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for (int test_case = 1; test_case <= T; test_case++) {
            int length = sc.nextInt();
            sc.nextLine();
            String str = sc.nextLine();
            char[] arr = str.toCharArray();

            System.out.println("#"+test_case+" "+(check(arr, length) ? 1 : 0));
        }
    }

    private static boolean check(char[] arr, int length) {
        Map<Character, Character> dict = new HashMap<>();
        char[][] pairs = {{'(', ')'}, {'[', ']'}, {'{', '}'}, {'<', '>'}};
        for (char[] pair : pairs) {
            dict.put(pair[0], pair[1]);
        }

        Stack<Character> stack = new Stack<>();

        for (char c : arr) {
            if (dict.containsKey(c)){
                stack.push(c);
            } else {
                if (stack.isEmpty())
                    return false;
                char open = stack.pop();
                if(!dict.get(open).equals(c)){
                    return false;
                }
            }
        }
        
        return stack.isEmpty();
    }
}
