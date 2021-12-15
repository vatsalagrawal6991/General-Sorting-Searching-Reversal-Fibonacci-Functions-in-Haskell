import System.Random (randomRs,mkStdGen)

{-**************************************************************************************************************
2) Double Summation function
-}
summation f a b c d =    if b<a || d<c
                         then 0
                         else double f b c d + summation f a (b-1) c d

double f b c d =    if d>=c
                    then f b d + double f b c (d-1)
                    else 0

--f b d = b+d 

{-Proof- 
specs -        summation f a b c d=     double f b c d + summation f a (b-1) c d if b>=a
                                        0   if b<a
               double f b c d =         f b d + double f b c (d-1) if d>=c
                                        0 if d<c
 
     Base Case:if b==a or d==c  
               then our ans should be f a c
               Now from our algo we have 
               summation f a b c d=     double f b c d + summation f a (b-1) c d
               summation f a (b-1) c d =0
               double f b c d =f a c
               Thus Base Case Proved 
     IH :      Let for any b' <b and d' <d our algo is correct
               i.e summation f a b' c d'=     double f b' c d' + summation f a (b'-1) c d' is correct
     IS :      Now for any b>b' and d>d' we have 
               summation f a b c d=     double f b c d + summation f a (b-1) c d
               now clearly if b'=b-1 and d'=d-1 
               then summation f a b c d = summation f a b' c d' + summation f b b c d + summation f a b' d d 
               Now by our IH step summation f a b' c d' is true 
               and summation f b b c d is summation of f with b as constant and varyiny c to d 
               and summation f a b' d d is keeping d constant and varying a to b'
               Thus our summation f a b c d  match the mathematical specs in the question
               thus our inductive hypothesis hold true and we have proved our algo

Time analysis: T(n1,n2)  = T(n1-1)+T(n2)
               T (n2)    = O(n2)
               T(n1,n2)  = T(n1-1)+O(n2)
               where n1 = b-a+1 and n2=d-c+1
               Thus we have T(n1,n2)=O(n2)*O(n1)
               Thus T(n1,n2)=O(n2*n1)
          
-}

{-
******************************************************END**************************************
-}
