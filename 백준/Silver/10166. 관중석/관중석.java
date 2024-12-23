import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class Main {
    static Scanner sc = new Scanner(System.in);
    private static final int D1 = sc.nextInt();
    private static final int D2 = sc.nextInt();

    public static void main(String[] args) {
        solution();
    }

    static void solution() {
        Set<String> uniqueAngles = new HashSet<>();

        for(int i=D1; i<=D2; i++) {
            for(int j=1; j<=i; j++) {
                int gcd = gcd(i, j);
                uniqueAngles.add((i/gcd) + "/" + (j/gcd));
            }
        }

        System.out.println(uniqueAngles.size());
    }

    static int gcd(int a, int b) {
        if (b == 0) {
            return a;
        }
        return gcd(b, a % b);
    }
}
