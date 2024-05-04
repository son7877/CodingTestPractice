import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int num = Integer.parseInt(br.readLine());

        Map<String,Integer> map = new HashMap<>();
        for(int i=0;i<num;i++){
            String str = br.readLine();
            map.put(str,str.length());
        }
        
        List<Map.Entry<String, Integer>> entryList = new ArrayList<>(map.entrySet());
        entryList.sort(Map.Entry.comparingByKey()); // 사전 순 정렬
        entryList.sort(Map.Entry.comparingByValue()); // 길이 순 정렬

        for (Map.Entry<String, Integer> entry : entryList)
            System.out.println(entry.getKey());
    }
}
