import System.Random (randomRs,mkStdGen)
{-///////////////////////////////////////////////////////////////////////////////////////////////////////
********************Problem 1 - Listing and Sorting*****************************************
-}

{-*************************************************************************************************************
1.5) recursive quick sort
-}

recursiveQuick a =  case a of
                              [] -> []
                              [x] -> [x]
                              (y:z)->   let (b,c)=partition z y [] []
                                        in recursiveQuick b ++ [y] ++ recursiveQuick c

partition a y b c= case a of
                              []->(b,c)
                              (x:w) ->  if x<=y
                                   then partition w y (x:b) c
                                   else partition w y b (x:c)


{-Proof- 
specs -        recursiveQuick a=   [] if a==[];
                                   recursiveQuick b ++ [y] ++ recursiveQuick c  if a= (y:z)
                                        b and c are partition on pivot y
     
     Base Case:at a=[] we have 
               we have recursiveQuick =[]
               also as a is null so sorting will also result null  
               Thus Base Case Proved 
     IH :      Let for any k<n step our algo is true, n is length of a
               i.e recursiveQuick x is true  and x is of length k
               recursiveQuick x= recursiveQuick b' ++ [y] ++ recursiveQuick c'
     IS :      Now for any step n>k we have 
               recursiveQuick a=   recursiveQuick b ++ [y] ++ recursiveQuick c
               here y is put at correct position due to the partition and b an c are of length less than n 
               so by our IH recursiveQuick b and recursiveQuick c will give correct sorted list and y is placed at right position
               in this sorted list between 2 sorted partition and partition left to it has element value less than it and right one has element more than it
               Thus our  recursiveQuick a will give corrrect sorted array
               thus our inductive hypothesis hold true and we have proved

Time analysis: T(n)
          average case=       1 for n=0
                              T(n/2)+T(n/2)+n for n>0
                              on solving this we have general equation as T(n)=T k(n/2^k)+k(n/2^k)+kn
                              putting k=0 we have T(n)=O(n*logn)
                              Thus we have T(n)=O(n*logn)
          Worst case=         1 for n=0
                              T(n-1)+n for n>0
                              on solving this we have T(n)=O(n^2)
                              Thus we have T(n)=O(n^2)
-}

