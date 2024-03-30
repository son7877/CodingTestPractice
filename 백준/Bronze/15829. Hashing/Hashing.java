import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = Integer.parseInt(sc.nextLine());
        String str = sc.nextLine();
        char []  c =str.toCharArray();
        int [] intArr = new int[num];

        int sum =0;
        for(int i=0;i<intArr.length;i++){
            intArr[i]= c[i]-'a'+1;
            sum += intArr[i]*Math.pow(31,i);
        }
        System.out.println(sum%1234567891);

    }
}
