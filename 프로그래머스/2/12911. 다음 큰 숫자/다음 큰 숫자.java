class Solution {
    public int solution(int n) {
        int answer = 0;
        String s1 = Integer.toBinaryString(n);
        char[] s1Array = s1.toCharArray();
        int num =0;
        for (int i = 0; i < s1Array.length; i++) {
            if (s1Array[i] == '1') {
                num++;
            }
        }
        while(true){
            int count = 0;
            n++;
            String s2 = Integer.toBinaryString(n);
            char [] s2Array = s2.toCharArray();
            for(int i=0;i<s2Array.length;i++){
                if(s2Array[i]=='1'){
                    count++;
                }
            }
            if(num==count){
                answer = n ;
                break;
            }
        }
        return answer;
    }
}