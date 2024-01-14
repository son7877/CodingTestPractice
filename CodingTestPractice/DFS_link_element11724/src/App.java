import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class App {
    /* DFS 원리(스택)
     * 그래프로 표현 후 인접리스트로 그래프 표현
     * 스택 자료구조에 시작노드 넣고 pop()
     * pop()된 노드의 인접 노드들을 다시 스택에 push()
     * 스택에 삽입된 노드들은 방문배열 체크
     * (대부분의 DFS는 재귀 함수방식으로 해결)
     */
    /*
     * 출력 : 연결 요소 개수 즉, DFS 진행 횟수
     */
    static ArrayList<Integer> [] A ;
    static boolean check [];
    public static void main(String[] args) throws Exception {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(bf.readLine());
        int n = Integer.parseInt(st.nextToken()); // n->노드 개수
        int m = Integer.parseInt(st.nextToken()); // m->엣지 개수
        
        A = new ArrayList[n+1]; // 그래프 데이터 저장 인접리스트
        check = new boolean[n+1]; // 방문 기록 체크 배열, 배열 0번 인덱스 제외하기 위함

        for(int i =1 ; i<n+1; i++){
            A[i] = new ArrayList<Integer>(); // 인접 리스트 초기화
        }
        
        for(int i =0; i<m; i++){ // 서로 연결되어 있는 노드 입력 (2번째 줄부터)
            st = new StringTokenizer(bf.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());

            // 단방향이 아닌 양방향 엣지연결
            A[u].add(v);
            A[v].add(u);
        }

        int count = 0; // 연결 요소 개수 초기화

        for(int i=1 ;i<n+1; i++){
            // 방문하지 않은 노드가 있을 경우 - 미리 카운트 올리고 DFS 시작
            if(check[i]==false){
                count++;
                DFS(i);
            }
        }
        
        System.out.println(count);
    }

    /*
     * 재귀 형식 
     */
    static void DFS(int num){
        if(check[num]==true){ // 이미 방문한 노드일 경우
            return; 
        }
        check[num] = true;
        for(int i : A[num]){
            if(check[i]==false){ // 연결노드 중 방문하지 않은 노드가 있을 시
                DFS(i);
            }
        }
    }  
}

