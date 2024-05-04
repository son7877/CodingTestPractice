import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Queue;

public class Main {
    static int n,m;
    static int [][] maze;
    static boolean [][] visited;
    /*
        (-1,0),(1,0),(0,-1),(0,1)
     */
    static int [] dx = {-1,1,0,0};
    static int [] dy = {0,0,-1,1};
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String [] str = br.readLine().split(" ");

        // 입력
        n = Integer.parseInt(str[0]);
        m = Integer.parseInt(str[1]);
        maze = new int [n][m];
        visited = new boolean [n][m];

        for(int i=0;i<Integer.parseInt(str[0]);i++){
            String mazeStr = br.readLine();
            char [] c = mazeStr.toCharArray();
            for(int j=0;j<Integer.parseInt(str[1]);j++){
                maze[i][j]= c[j]-'0';
            }
        }

        //(0,0)에서 시작
        visited [0][0] = true;
        bfs(0,0);
        System.out.println(maze[n-1][m-1]);
    }
    public static void bfs(int num1, int num2){
        Queue<int[]> queue = new LinkedList<>();
        queue.add(new int[]{num1,num2});

        while(!queue.isEmpty()){
            int [] now = queue.poll();
            int x = now[0];
            int y = now[1];
            for(int i=0;i<dx.length;i++){
                int nx = x + dx[i];
                int ny = y + dy[i];
                if(nx<n && nx>=0 && ny<m && ny>=0){
                    if(maze[nx][ny]==1 && !visited[nx][ny]){
                        queue.add(new int[]{nx,ny});
                        visited[nx][ny] = true;
                        maze[nx][ny] = maze[x][y]+1;
                    }
                }

            }

        }
    }
}
