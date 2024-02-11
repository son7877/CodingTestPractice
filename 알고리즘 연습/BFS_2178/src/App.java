import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class App {
    /*
     * nxm의 크기의 미로
     * (1,1)에서 출발하여 (n,m)위치로 이동하기 위해 지나야 하는 칸 수의 최솟값 구하기
     * 각각 칸 마다 1은 이동 가능, 0은 이동 불가
     */
    static int dx [] = { 0, 1, 0, -1}; // 좌우 탐색을 위한 배열
    static int dy [] = { 1, 0, -1, 0}; // 상하 탐색을 위한 배열
    static boolean check[][]; // 방문 체크 배열
    static int A[][]; // 미로 배열
    static int N,M; // 미로 배열 크기
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        // 2차원 배열(미로) 입력
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());

        A = new int[N][M];
        check = new boolean[N][M];

        for(int i =0;i<N;i++){
            st = new StringTokenizer(br.readLine());
            String line = st.nextToken();
            for(int j =0;j<M;j++){
                A[i][j]= Integer.parseInt(line.substring(j,j+1));
            }
        }

        // 최단거리 탐색
        BFS(0,0);
        System.out.println(A[N-1][M-1]);

    }
    //너비 우선 탐색(큐)
    private static void BFS(int i, int j) {
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{i,j});
        check[i][j] = true;
        while(!queue.isEmpty()){
            int now [] = queue.poll();
            for(int k =0;k<4;k++){
                int x = now[0] + dx[k];
                int y = now[1] + dy[k];
                if(x>=0 && y>=0 && x<N && y <M){
                    if(!check[x][y] && A[x][y] !=0){
                        check[x][y]= true;
                        A[x][y] = A[now[0]][now[1]]+1;
                        queue.add(new int[] {x,y});
                    }
                }
            }
        }
            
        
    }
}
