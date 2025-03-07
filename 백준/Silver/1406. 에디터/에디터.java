import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Stack;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        String words= bf.readLine();
        int N = Integer.parseInt(bf.readLine());
        String[][] commands = new String[N][2];

        for(int i = 0; i < N; i++){
            commands[i] = bf.readLine().split(" ");
        }

        System.out.printf("%s", solution(words, commands));
    }

    static String solution(String words, String[][] commands) {
        Character[] word = new Character[words.length()];
        for (int i = 0; i < words.length(); i++) {
            word[i] = words.charAt(i);
        }

        Stack<Character> left = new Stack<>();
        Stack<Character> right = new Stack<>();

        for (Character c : word) {
            left.push(c);
        }

        for (String[] command : commands) {
            switch (command[0]) {
                case "L":
                    if (!left.isEmpty()) {
                        right.push(left.pop());
                    }
                    break;
                case "D":
                    if (!right.isEmpty()) {
                        left.push(right.pop());
                    }
                    break;
                case "B":
                    if (!left.isEmpty()) {
                        left.pop();
                    }
                    break;
                case "P":
                    left.push(command[1].charAt(0));
                    break;
            }
        }

        return left.toString()
                .replaceAll("[\\[\\], ]", "")
                + new StringBuilder(right.toString())
                    .reverse()
                    .toString()
                    .replaceAll("[\\[\\], ]", "");
    }
}
