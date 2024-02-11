import java.util.ArrayList;

class Solution {
    public int[] solution(int brown, int yellow) {
        int[] answer = new int[2];
        int sum = brown+yellow;
        ArrayList<Integer> list = new ArrayList<>();
        int i=sum;
        //타일의 합의 약수를 배열1에 저장(내림차순으로 정렬)
        while(i>0) {
            if (sum % i == 0) {
                list.add(i);
            }
            i--;
        }
        for(int k=0;k<list.size();k++){
            
            if(yellow == (list.get(k)-2)*(list.get(list.size()-1-k)-2)){
                answer = new int[]{list.get(k) , list.get(list.size() - 1 - k)};
                break;
            }
        }
        System.out.println(list);
        System.out.println(answer[0]);

        return answer;
    }
}
