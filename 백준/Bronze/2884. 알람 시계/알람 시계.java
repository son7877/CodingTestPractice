
import java.util.Scanner;

public class Main {
    public static void main(String [] args){
        Scanner sc = new Scanner(System.in);
        int hour = sc.nextInt();
        int minute =sc.nextInt();

        if(hour == 0){
            if(minute<45){
                hour =23;
                minute = minute+60-45;
            }else{
                minute -= 45;
            }
        }else{
            if(minute<45){
                hour--;
                minute = minute+60-45;
            }else{
                minute -= 45;
            }
        }
        System.out.println(hour+" "+minute);
    }
}
