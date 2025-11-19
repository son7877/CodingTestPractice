import java.util.*;
public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        sc.nextLine();

        for(int test_case=1;test_case<=T;test_case++){
            String input = sc.nextLine();
            char[] charArr = input.toCharArray();
            boolean answer = true;

            // 1번 조건 확인 : 0부터 9까지의 각 숫자는 등장하지 않거나, 등장한다면 정확히 두 번 등장한다.
            Map<Character, Integer> countMap = new HashMap<>();

            for(char c: charArr){
                countMap.put(c, countMap.getOrDefault(c,0)+1);
            }

            for(char c: charArr){
                if(countMap.get(c) != 2) {
                    answer = false;
                    break;
                }
            }

            // 2번 조건 확인 :  숫자 d가 두 번 등장한다면, 두 숫자 사이에 있는 숫자의 개수는 d개이다.
            Map<Character, Integer> firstPos = new HashMap<>();
            Map<Character, Integer> lastPos = new HashMap<>();

            for(int i = 0; i < charArr.length; i++){
                char c = charArr[i];
                firstPos.putIfAbsent(c, i);
                lastPos.put(c, i);
            }

            for(char c: countMap.keySet()){
                if(countMap.get(c) == 2){
                    int distance = lastPos.get(c) - firstPos.get(c) - 1;
                    int digitValue = Character.getNumericValue(c);
                    if(distance != digitValue){
                        answer = false;
                        break;
                    }
                }
            }

            System.out.println(answer ? "yes" : "no");

        }
    }
}
