import java.util.*;

public class Solution {
    static class Node {
        String value;
        int left;
        int right;
        Node(String value) { this.value = value; }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;
        for (int test_case = 1; test_case <= T; test_case++) {
            int N = sc.nextInt();
            sc.nextLine();

            Node[] nodes = new Node[N + 1];
            for (int i = 0; i < N; i++) {
                String[] input = sc.nextLine().trim().split(" ");

                int idx = Integer.parseInt(input[0]);
                String val = input[1];
                
                Node node = new Node(val);

                if (input.length == 4) { 
                    node.left = Integer.parseInt(input[2]);
                    node.right = Integer.parseInt(input[3]);
                }
                nodes[idx] = node;
            }

            int result = (int) eval(1, nodes);
            System.out.println("#"+test_case+" "+result);
        }
    }

    private static int eval(int idx, Node[] nodes) {
        Node node = nodes[idx];
        String v = node.value;
        if (isNumber(v)) {
            return Integer.parseInt(v);
        }
        int left = eval(node.left, nodes);
        int right = eval(node.right, nodes);
        switch (v) {
            case "+": return left + right;
            case "-": return left - right;
            case "*": return left * right;
            case "/": return left / right;
            default: return 0;
        }
    }

    private static boolean isNumber(String s) {
        for (int i = 0; i < s.length(); i++){
            if (!Character.isDigit(s.charAt(i))) return false;
        }
        return s.length() > 0;
    }
}