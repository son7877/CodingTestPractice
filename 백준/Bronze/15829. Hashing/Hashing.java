import java.util.Scanner;
public class Main {
    static final int M = 1234567891;
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int num = Integer.parseInt(sc.nextLine());
        String str = sc.nextLine();
        char []  c =str.toCharArray();
        int [] intArr = new int[num];

        long sum =0;
        long r =1;
        for(int i=0;i<intArr.length;i++){
            intArr[i]= c[i]-'a'+1;
            sum += intArr[i]*r%M;
            r = (r*31)%M;
        }
        System.out.println(sum%M);

    }
}
