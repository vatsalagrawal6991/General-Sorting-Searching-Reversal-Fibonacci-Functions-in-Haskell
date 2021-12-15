import System.Random (randomRs,mkStdGen)
{-///////////////////////////////////////////////////////////////////////////////////////////////////////
********************Problem 1 - Listing and Sorting*****************************************
-}


{-******************************************************************************************************
1.4) Tail recursive insertion sort
-}
tailInsertion a =   case a of
                              []->[]
                              [x]->[x]
                              (x:z)->sorting z [x]

sorting a c=   let  (d:l)=a
               in   if a==[]
                    then c
                    else sorting l (insertion d c [])

insertion d c f =   let (e:l2)=c
                    in   if c==[]
                         then f++[d]
                         else if d<=e
                              then f++[d]++c
                         else insertion d l2 (f++[e])

{-Proof- 
specs -        sorting a c=   c if a==[];
                              sorting l (insertion d c []) otherwise where a is of form (d:l); 

Invariant -    At any iteration of loop say k and length n ,k<n we have 
               sorting a [] =  sorting x c here 
               length x + length c = length a
               and c is sorted containg starting k elemts of n and a is unsorted containg last  n-k elements
     
     Base Case:at k=0 we have 
               sorting a [] =  sorting x c 
               c is null here
               so that length a = length x
               Thus sorting a [] =  sorting x c 
               Thus Base Case Proved 
     IH :      Let for any k<n step our invariant is true 
               i.e sorting a [] =  sorting x c here 
               length x + length c = length a
               and c is sorted containg starting k elemts of n and a is unsorted containg last  n-k elements
     IS :      Now for any step k+1 we have 
               sorting a [] =  sorting x' c'
               but c is sorted as there is one element in c' which when take out from c' it will become c 
               and that element is inserted by considering all elemnet in c
               Thus our  sorting a [] =  sorting x' c'= sorting x c 
               thus our inductive hypothesis hold true and we have proved

Time analysis: T(n)=     1 for n=0
                         T(n-1)+n for n>0
               on solving this we have general equation as T(n)=T(n-k)+n+n-1+n-2.........+n-K+1
               putting k=0 we have T(n)=O(n^2)
               Thus we have T(n)=O(n^2)
-}



