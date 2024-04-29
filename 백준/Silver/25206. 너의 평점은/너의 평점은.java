import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String univerCity [][] = new String[20][3];
        Map<String,Double> score = new HashMap<>();

        score.put("A+",4.5);
        score.put("A0",4.0);
        score.put("B+",3.5);
        score.put("B0",3.0);
        score.put("C+",2.5);
        score.put("C0",2.0);
        score.put("D+",1.5);
        score.put("D0",1.0);
        score.put("F",0.0);

        double scoreSum = 0;
        double subjectSum =0;

        for(int i=0;i<univerCity.length;i++){
            univerCity[i] = br.readLine().split(" ");
            if(univerCity[i][2].equals("P")) continue;
            subjectSum += Double.parseDouble(univerCity[i][1]);
            scoreSum += (Double.parseDouble(univerCity[i][1]) * score.get(univerCity[i][2]));
        }

        double answer = scoreSum/subjectSum;
        System.out.println(answer);
    }

}
