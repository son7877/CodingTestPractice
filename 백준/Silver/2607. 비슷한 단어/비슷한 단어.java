import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // input
        int num = Integer.parseInt(br.readLine());
        String[] words = new String[num];
        for (int i = 0; i < num; i++) {
            words[i] = br.readLine();
        }
        String targetWord = words[0];

        // output
        System.out.print(solution(words, targetWord));
    }

    static int solution(String[] words, String targetWord) {
        int count = 0;
        for (int i = 1; i < words.length; i++) {
            if (isSimilar(words[i], targetWord)) {
                count++;
            }
        }
        return count;
    }

    static boolean isSimilar(String word, String targetWord) {
        if (Math.abs(word.length() - targetWord.length()) > 1) {
            return false;
        }

        int[] count = new int[26]; // A-Z
        for (char c : word.toCharArray()) {
            count[c - 'A']++;
        }
        for (char c : targetWord.toCharArray()) {
            count[c - 'A']--;
        }

        int positiveCount = 0;
        int negativeCount = 0;
        for (int i : count) {
            if (i > 0) {
                positiveCount += i;
            } else if (i < 0) {
                negativeCount += -i;
            }
        }

        if (word.length() == targetWord.length()) {
            return positiveCount == 1 && negativeCount == 1
                    || positiveCount == 0 && negativeCount == 0;
        } else {
            return positiveCount + negativeCount == 1;
        }
    }
}
