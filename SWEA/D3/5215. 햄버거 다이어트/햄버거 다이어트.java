import java.util.*;
public class Solution {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);

        int T = sc.nextInt();

        for(int test_case=1; test_case<=T;test_case++) {
            int ingredients = sc.nextInt();
            int caloriesLimit = sc.nextInt();

            int[] dp = new int[caloriesLimit + 1];

            for(int i=0;i<ingredients;i++){
                // ( 맛의 점수, 칼로리 )
                int flavorScore = sc.nextInt();
                int calory = sc.nextInt();

                // 정해진 칼로리 이하의 조합 중에서 가장 점수가 높은 조합 구하기
                for (int j=caloriesLimit;j >= calory;j--) {
                    dp[j] = Math.max(dp[j], dp[j-calory] + flavorScore);
                }
            }

            System.out.println("#" + test_case + " " + dp[caloriesLimit]);
        }
    }
}
