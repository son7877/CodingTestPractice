import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Main {
    public static void main(String[] args) throws NumberFormatException, IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine();
        int[] arr = new int[26];
        for(int i = 0; i < arr.length; i++) {
			arr[i] = -1;
		}
        for(int i=0;i<str.length();i++){
            char c = str.charAt(i);
            if(arr[c-'a']==-1){
                arr[c-'a']=i;
            }
        }
        for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
        br.close();


    }
}
