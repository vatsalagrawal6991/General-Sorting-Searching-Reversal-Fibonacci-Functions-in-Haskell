import System.Random (randomRs,mkStdGen)
{-///////////////////////////////////////////////////////////////////////////////////////////////////////
********************Problem 1 - Listing and Sorting*****************************************
-}

{-**************************************************************************************************************
1.6) recursive binary search
-}

recursiveBinary a b c d= let m = quot (c+d) 2
                         in   if c==d
                              then if (a!!c)==b
                                   then "match at index "++show m
                                   else "not match"
                              else if c<d
                                   then if (a!!m)==b
                                        then "match at index "++show m
                                        else if (a!!m)< b
                                             then recursiveBinary a b (m+1) d
                                        else recursiveBinary a b c (m-1)
                              else  "not match"



{-Proof- 
specs -        recursiveBinary a=  found if c==d & a at c = b;
                                   not found if c==d & a at c != b
                                   found if c<d && a at m = b 
                                   recursiveBinary a b (m+1) d if c<d && a at m < b 
                                   recursiveBinary a b c (m-1) if c<d && a at m < b
                                   no found if c>d
                                   
     
     Base Case:at c==d we have
               only one elemnt in list a and if it equal b 
               then found otherwise not found 
               this is satisfied by our specs  
               found if c==d & a at c = b;
               not found if c==d & a at c != b 
               Thus Base Case Proved 
     IH :      Let for any k<n our algo is true, k is length of d-c+1
               i.e recursiveBinary a' b' c' d' is true and give correct answer
     IS :      Now for any step n>k we have 
               recursiveBinary a b c d =     recursiveBinary a b (m+1) d if c<d && a at m < b 
                                             recursiveBinary a b c (m-1) if c<d && a at m < b
               Case 1: when m<b
               we have recursiveBinary a b (m+1) d 
               now d-m-1+1 is less than n 
               Thus by Ih it gives correct answer
               also for all other elennt other than in range m+1 and d, they are less than b and m
               Case 2: when m>b
               we have recursiveBinary a b c (m-1)
               now m-1-d+1 is less than n 
               Thus by Ih it gives correct answer
               also for all other elennt other than in range m-1 and b, they are greater than b and m
               Thus our  recursiveBinary will give corrrect answer
               thus our inductive hypothesis hold true and we have proved

Time analysis: T(n)=1 for n=0
                    T(n/2)+1/+n for n>0
               on solving this we have general equation as T(n)=T (n/2^k)+k
               putting k=0 we have T(n)=O(logn)
               Thus we have T(n)=O(logn)
          
-}

