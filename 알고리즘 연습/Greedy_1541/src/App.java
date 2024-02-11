import java.util.Scanner;

public class App {
    static int answer = 0;
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        String exp = sc.nextLine();
        String MinusStr[] = exp.split("-");
        for(int i=0;i<MinusStr.length;i++){
            int temp = plus(MinusStr[i]);
            if(i==0){
                answer = answer + temp;
            }
            else{
                answer = answer - temp;
            }
        }
        System.out.println(answer);

    }
    private static int plus(String string) {
        int sum = 0;
        String PlusStr[] = string.split("\\+"); 
        /*
        (+,*,^)기호는 특별한 의미로 쓰이는 경우가 있기 때문에 meta character 오류 발생하므로
        사이에 [] 나 앞에 \\를 추가해야 함!!!
        */
        for(int i=0;i<PlusStr.length;i++){
            sum += Integer.parseInt(PlusStr[i]);
        }
        return sum;
    }
    
}
