
class Solution {
    /*
    비내림차순으로 정렬된 수열이 주어질 때, 다음 조건을 만족하는 부분 수열을 찾으려고 합니다.
    기존 수열에서 임의의 두 인덱스의 원소와 그 사이의 원소를 모두 포함하는 부분 수열이어야 합니다.
    부분 수열의 합은 k입니다. -> 누적합 알고리즘
    합이 k인 부분 수열이 여러 개인 경우 길이가 짧은 수열을 찾습니다.
    길이가 짧은 수열이 여러 개인 경우 앞쪽(시작 인덱스가 작은)에 나오는 수열을 찾습니다. -> math함수로 최소 인덱스 찾기
    수열을 나타내는 정수 배열 sequence와 부분 수열의 합을 나타내는 정수 k가 매개변수로 주어질 때,
    위 조건을 만족하는 부분 수열의 시작 인덱스와 마지막 인덱스를 배열에 담아 return 하는 solution 함수를 완성해주세요.
    이때 수열의 인덱스는 0부터 시작합니다.

    sequence	            k	result
    [1, 2, 3, 4, 5]	        7	[2, 3]
    [1, 1, 1, 2, 3, 4, 5]	5	[6, 6]
    [2, 2, 2, 2, 2]	        6	[0, 2]
     */
    public int[] solution(int[] sequence, int k) {
        int[] answer = {};
        int left=0, right=0, sum=0, n = 0,m =0;
        int range = sequence.length;

        for(right=0;right<sequence.length;right++){
            sum += sequence[right];
            while(sum>k){
                sum -= sequence[left];
                left++;
            }
            // 누적합이 k와 같을때
            if(sum==k){
                if(range > right-left){
                    range = right-left;
                    n=left;
                    m=right;
                }else if (range == right-left){
                    n=Math.min(n,left);
                    m=Math.min(m,right);
                }

            }
        }
        return new int [] {n,m};
    }
}