class Solution {
    public String solution(String s) {
        String answer = "";
        String [] arr = s.split(" ");
        for(int i=0;i<arr.length;i++){
            if(arr[i].length()==0) answer += " ";
            else{
                answer += arr[i].substring(0, 1).toUpperCase();
                answer += arr[i].substring(1,arr[i].length()).toLowerCase();
                answer += " ";
            }   
        }
        if(s.substring(s.length()-1,s.length()).equals(" ")){
            return answer;
        }
        
        return answer.trim();
    }
}