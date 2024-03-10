
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        ArrayList<Integer> num  = new ArrayList<>();
        for(int i=0;i<9;i++){
            num.add(Integer.parseInt(br.readLine()));
        }
        Integer[] arr = num.toArray(new Integer[num.size()]);
        Arrays.sort(arr);
        int max = arr[arr.length-1];
        System.out.println(max);
        System.out.println(num.indexOf(max)+1);



    }
}
