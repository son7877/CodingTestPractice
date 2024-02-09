import java.util.Stack;

class Solution {
    public int solution(String s) {
        int answer = -1;
        Stack<Character> stack = new Stack<>();
        char c[] = s.toCharArray();
        stack.push(c[0]);
        for (int i = 1; i < c.length; i++) {
            if(!stack.empty()){
                if (c[i] == stack.peek()) {
                    stack.pop();
                    continue;
                } else {
                    stack.push(c[i]);
                }
            }else{
                stack.push(c[i]);
            }
        }
        if (!stack.empty()) {
            answer = 0;
        } else {
            answer = 1;
        }

        System.out.println(answer);
        return answer;
    }
}

