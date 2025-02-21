class Solution {
    public int solution(String name) {
        int answer = 0;
        int len = name.length();
        int minMove = len - 1;

        for(int i = 0; i < len; i++){
            answer += Math.min(name.charAt(i) - 'A', 'Z' - name.charAt(i) + 1);

            int next = i + 1;
            while(next < len && name.charAt(next) == 'A'){
                next++;
            }

            minMove = Math.min(minMove, i + len - next + Math.min(i, len - next));
        }

        answer += minMove;

        return answer;
    }
}