import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Map<String,Integer> map = new HashMap<>();
        String card = sc.nextLine();

        Integer num2 =0;
        for(int i=0;i<Integer.parseInt(card);i++){
            String str []= sc.nextLine().split(" ");
            String name = str[0];
            Integer num = Integer.parseInt(str[1]);
            if(map.containsKey(name)) {
            	num2 = map.get(name)+num;
            	map.put(name,num2);
            }else {
            	map.put(name,num);
            }
            
        }
        
        if(map.containsValue(5)){
            System.out.println("YES");
        }else{
            System.out.println("NO");
        }


        
    }

}