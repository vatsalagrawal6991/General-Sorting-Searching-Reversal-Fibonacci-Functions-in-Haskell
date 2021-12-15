
{-///////////////////////////////////////////////////////////////////////////////////////////////////////
********************Problem 1 - Listing and Sorting*****************************************
-}
{-**************************************************************************************
1.1) Tail recursive reversal of list
-}
tailReversal a =    case a of
                              []->[]
                              [x]->[x]
                              (x:l)-> reversal l [x]

reversal a c = let  (d:l)=a
               in   if a==[]
                    then c
                    else reversal l (d:c)
{-Proof- 
specs -        reversal a c = c if a is empty; 
                              reversal l (d:c) when a is of form (d:l)

Invariant -    At any iteration of loop say k and list size n,k<n we have 
               tailReversal a =  tailReversal x ++ c  , here x is list with n-k last elemnts of a
               also, length c + length x = length a
     
     Base Case:at k=0 we have 
               tailReversal a =  tailReversal x ++ c
               we have c as empty and x have n elements 
               Thus tailReversal a =  tailReversal x
               Thus Base Case Proved 
     IH :      Let for any k<n step our invariant is true 
               i.e tailReversal a =  tailReversal x ++ c 
     IS :      Now for any step k+1 we have 
               tailReversal x' ++ c'
               Now as x' is of length n-k-1 and c of size k+1
               also we have c as w:c (list form)
               Thus our equation can become tailReversal x' ++[w]++ c
               Now if we add w to x' by adding it into front as we have removed it from front of list which form x'
               we have tailReversal x ++ c
               This is same as IH 
               thus our inductive hypothesis hold true and we have proved tailReversal a =  tailReversal x ++ c 

Time analysis: T(n)=     1 for n=0
                         T(n-1)+1 for n>0
               on solving this we have general equation as T(n)=T(n-k)+k
               putting k=0 we have T(n)=O(n)
               Thus we have T(n)=O(n)
-}

