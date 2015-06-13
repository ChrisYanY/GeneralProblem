public class Solution {
    public int singleNumber(int[] A) {
        int A_len = A.length;
        if (A_len == 1) return(A[0]);
        int[] B = new int[(int)((A.length + 1)/2)];
        int stack_size = 0;
        int stack_pin = 0;
        int cur_elem = 0;
        int mover = 0;
        for (mover = 0; mover < A_len; mover ++) {
            cur_elem = A[mover];
            // search current element in B
            if (stack_size > 0) {
                for (stack_pin = 0; stack_pin < stack_size; stack_pin ++) {
                    if (cur_elem == B[stack_pin]) { // find
                        if (stack_size - 1 > stack_pin) {
                            B[stack_pin] = B[stack_size - 1];
                            stack_size --;
                            break;
                        } else {
                            stack_size --;
                            break;
                        }
                    }
                }
                if (stack_pin == stack_size) { // did not find
                    B[stack_pin] = cur_elem;
                    stack_size ++;
                } 
            } else {
                B[0] = cur_elem;
                stack_size ++;
            }
            
        }
        return(B[0]);
        
    }
}