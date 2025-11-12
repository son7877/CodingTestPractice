import java.util.*;

public class Solution {
    static int[][] maze = new int[16][16];
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = 10;

        for(int test_case = 1; test_case <= T; test_case++)
        {
            int number = sc.nextInt();
            sc.nextLine();

            for(int i=0;i<maze.length;i++){
                String inputStr = sc.nextLine();
                for(int j=0;j<inputStr.length();j++){
                    maze[i][j] = inputStr.charAt(j) - '0';
                }
            }

            boolean start = false;

            for(int i=0;i<maze.length;i++){
                for(int j=0;j<maze.length;j++){
                    if(maze[i][j] == 2) {
                        start = true;
                        System.out.println("#"+number+" "+(search(i,j) ? 1 : 0));
                        break;
                    }
                }
                if (start) break;
            }
        }
    }

    private static boolean search(int i, int j){
        int[] dx = {0,1,0,-1};
        int[] dy = {1,0,-1,0};

        boolean[][] visited = new boolean[16][16];

        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[] {i,j});
        visited[i][j] = true;

        while(!queue.isEmpty()){
            int[] now = queue.poll();
            for (int k=0;k<4;k++){
                int x = now[0]+dx[k];
                int y = now[1]+dy[k];
                if(x>=0 && y>=0 && x<16 && y<16) {
                    if(maze[x][y] != 1 && !visited[x][y]) {
                        if(maze[x][y] == 3) {
                            return true;
                        }
                        visited[x][y] = true;
                        maze[x][y] = maze[now[0]][now[1]]+1;
                        queue.add(new int[]{ x,y});
                    }
                }
            }
        }

        return false;
    }
}
