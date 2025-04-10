import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String input = br.readLine();

        System.out.println(solution(input));
    }

    public static int solution(String input) {
        int currentIndex = 0;
        int num = 1;

        while (currentIndex < input.length()) {
            String numStr = Integer.toString(num);

            for (char c : numStr.toCharArray()) {
                if(c == input.charAt(currentIndex)) {
                    currentIndex++;
                    if (currentIndex >= input.length()) {
                        return num;
                    }
                }
            }

            num++;
        }

        return num;
    }
}
