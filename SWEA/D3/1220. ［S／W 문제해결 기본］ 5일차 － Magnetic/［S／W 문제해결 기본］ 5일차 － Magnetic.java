import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for (int t = 1; t <= T; t++){
            int length = sc.nextInt();
            sc.nextLine();

            int[][] board = new int[length][length];

            for (int i = 0; i < length; i++){
                board[i] = Arrays.stream(sc.nextLine().split(" "))
                        .mapToInt(Integer::parseInt)
                        .toArray();
            }

            System.out.println("#"+t+" "+check(board));
        }
    }
    private static int check(int[][] board){
        int count = 0;
        Dictionary<Integer, List<Integer>> dict = new Hashtable<>();

        for (int i = 0; i < board.length; i++){
            List<Integer> column = new ArrayList<>();
            for(int j = 0; j < board[i].length; j++){
                if(board[j][i] != 0){
                    column.add(board[j][i]);
                }
            }
            if(!column.isEmpty()){
                dict.put(i, column);
            }
        }

        for (int i = 0; i < board.length; i++){
            if(dict.get(i) != null){
                List<Integer> column = dict.get(i);
                for (int j = 0; j < column.size() - 1; j++){
                    if(column.get(j) == 1 && column.get(j + 1) == 2){
                        count++;
                    }
                }
            }
        }

        return count;
    }
}
