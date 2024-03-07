import java.util.*;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String str =  sc.nextLine().trim();
		if(str.equals("")) {
			System.out.println(0);
		}else {
			String answer [] = str.split(" ");
			System.out.println(answer.length);
		}
		
	
	}

}