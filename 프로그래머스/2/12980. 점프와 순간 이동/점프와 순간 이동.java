import java.util.*;

public class Solution {
    public int solution(int n) {
        int ans = 0;
        String str = Integer.toBinaryString(n);
        char [] c = str.toCharArray();
        for(int i=0;i<c.length;i++){
            if (c[i]=='1') ans++;
        }

        return ans;
    }
}