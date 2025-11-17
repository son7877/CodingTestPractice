import java.util.*;

public class Solution {
    static class Node {
        char value;
        int left;
        int right;

        public Node(char value) {
            this.value = value;
            this.left = 0;
            this.right = 0;
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for(int test_case = 1; test_case <= T; test_case++){
            int N = sc.nextInt();
            sc.nextLine();

            Node[] nodes = new Node[N + 1];

            for(int i = 1; i <= N; i++) {
                String[] input = sc.nextLine().trim().split(" ");

                int idx = Integer.parseInt(input[0]);
                char value = input[1].charAt(0);

                if (nodes[idx] == null) nodes[idx] = new Node(value);
                else nodes[idx].value = value;

                if (input.length >= 3) nodes[idx].left = Integer.parseInt(input[2]);
                if (input.length >= 4) nodes[idx].right = Integer.parseInt(input[3]);
            }

            System.out.println("#" + test_case + " " + inorder(nodes, 1));
        }
    }

    static String inorder(Node[] nodes, int nodeNum) {
        if(nodeNum == 0) return "";

        StringBuilder sb = new StringBuilder();
        sb.append(inorder(nodes, nodes[nodeNum].left));
        sb.append(nodes[nodeNum].value);
        sb.append(inorder(nodes, nodes[nodeNum].right));

        return sb.toString();
    }
}