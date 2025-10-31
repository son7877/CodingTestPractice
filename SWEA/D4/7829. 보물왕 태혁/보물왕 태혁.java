import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T;
        T=Integer.parseInt(sc.nextLine());

        for(int i=1;i<=T;i++){
            int P =Integer.parseInt(sc.nextLine());

            int[] arr = Arrays.stream(sc.nextLine().split(" "))
                    .mapToInt(Integer::parseInt)
                    .toArray();

            int answer = getAnswer(arr);

            System.out.println("#"+i+" "+answer);
        }
    }
    private static int getAnswer(int[] arr) {
        if (arr.length == 1) {
            return (int) Math.pow(arr[0],2);
        } 
        int[] sortedArr = Arrays.stream(arr).sorted().toArray();
        return sortedArr[0] * sortedArr[sortedArr.length-1];
    }
}
