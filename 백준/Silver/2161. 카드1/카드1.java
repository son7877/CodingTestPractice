
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String n = sc.nextLine();
		
		Queue<Integer> q = new LinkedList<>();
		
		for(int i=1;i<=Integer.parseInt(n);i++) {
			q.add(i);
		}
		
		for(int i=0;i<Integer.parseInt(n);i++) {
			System.out.print(q.poll()+" ");
			q.add(q.poll());
		}
	

	}

}
