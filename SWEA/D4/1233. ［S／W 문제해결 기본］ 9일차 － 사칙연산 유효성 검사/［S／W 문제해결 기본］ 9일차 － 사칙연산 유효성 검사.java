import java.util.*;

public class Solution {
    static class Node {
        String value;
        int left;
        int right;

        Node(String value) {
            this.value = value;
            this.left = 0;
            this.right = 0;
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for (int test_case = 1; test_case <= T; test_case++) {
            int N = sc.nextInt();
            sc.nextLine(); // consume EOL

            Node[] nodes = new Node[N + 1];

            for (int i = 0; i < N; i++) {
                String[] input = sc.nextLine().trim().split(" ");
                int idx = Integer.parseInt(input[0]);
                String val = input[1];

                Node node = new Node(val);
                if (input.length >= 3) node.left = Integer.parseInt(input[2]);
                if (input.length >= 4) node.right = Integer.parseInt(input[3]);
                nodes[idx] = node;
            }

            boolean valid = true;

            for (int i = 1; i <= N && valid; i++) {
                Node node = nodes[i];
                if (node == null) { valid = false; break; }

                if (isOperator(node.value)) {
                    if (node.left == 0 || node.right == 0) valid = false;
                } else if (isNumber(node.value)) {
                    if (node.left != 0 || node.right != 0) valid = false;
                } else {
                    valid = false;
                }
            }

            System.out.printf("#%d %d\n", test_case, valid ? 1 : 0);
        }
    }

    private static boolean isOperator(String s) {
        return s.length() == 1 && "+-*/".indexOf(s.charAt(0)) >= 0;
    }

    private static boolean isNumber(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isDigit(s.charAt(i))) return false;
        }
        return s.length() > 0;
    }
}
