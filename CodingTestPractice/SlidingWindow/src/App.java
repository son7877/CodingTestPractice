import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class App {
    static int myArr [];
    static int checkArr [];
    static int checkSecret;
    public static void main(String[] args) throws Exception {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(bf.readLine());
        int S = Integer.parseInt(st.nextToken());
        int P = Integer.parseInt(st.nextToken());
        int count = 0;

        checkArr = new int[4]; // 조건 알파벳 개수
        myArr  = new int [4];
        char A [] = new char [S]; // 전체 문자열

        checkSecret = 0;

        A = bf.readLine().toCharArray();
        st = new StringTokenizer(bf.readLine());
        for(int i = 0; i<4 ; i++){
            checkArr[i] = Integer.parseInt(st.nextToken());
            if(checkArr[i] == 0 ){
                checkSecret++;
            }
        }

        //부분문자열 처음 받을 때
        for(int i = 0 ; i<P; i++){ 
            Add(A[i]);
        }
        if(checkSecret == 4){
            count++; 
        }
        //슬라이딩 윈도우(배열 덩어리를 한칸 씩 이동)
        for(int i=P; i<S; i++){
            int j = i-P;
            Add(A[i]);
            Remove(A[j]);
            if(checkSecret == 4) {
                count++;
            }
        }
        //결과 출력
        System.out.println(count);
        bf.close();
    }

    private static void Remove(char c) {
        switch (c) {
            case 'A':               
                if (myArr[0] == checkArr[0]){
                    checkSecret--;
                }
                myArr[0]--;
                break;
            case 'C':
                if (myArr[1] == checkArr[1]){
                    checkSecret--;
                }
                myArr[1]--;
                break;
            case 'G':
                if (myArr[2] == checkArr[2]){
                    checkSecret--;
                }
                myArr[2]--;
                break;
            case 'T':
                if (myArr[3] == checkArr[3]){
                    checkSecret--;
                }
                myArr[3]--;
                break;
        }
    }

    private static void Add(char c) {
        switch (c){
            case 'A':
                myArr[0]++;
                if(myArr[0] == checkArr[0]) 
                    checkSecret++;
                break;
            case 'C':
                myArr[1]++;
                if (myArr[1] == checkArr[1])
                    checkSecret++;
                break;
            case 'G':
                myArr[2]++;
                if (myArr[2] == checkArr[2])
                    checkSecret++;
                break;
            case 'T':
                myArr[3]++;
                if (myArr[3] == checkArr[3])
                    checkSecret++;
                break;
        }
    }

    
}
