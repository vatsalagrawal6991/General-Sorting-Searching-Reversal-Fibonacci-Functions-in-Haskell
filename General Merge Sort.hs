import System.Random (randomRs,mkStdGen)
{-///////////////////////////////////////////////////////////////////////////////////////////////////////
********************Problem 1 - Listing and Sorting*****************************************
-}
{-*******************************************************************************************************
1.2) Tail recursive merge function (of Merge sort (Merge list and sort them))
-}
tailMerge a b
               | a==[] = b
               | b==[] = a
               | otherwise = merge a b []

merge a b e    | a==[] = e++b
               | b==[] = e++a
               | otherwise =  let  (y:z)=a
                                   (x:w)=b
                              in   if y == x
                                   then merge z w (e++[y]++[x])
                                   else if y < x
                                        then merge z b (e++[y])
                                   else merge a w (e++[x])
splitL ls =
    case ls of
      [] -> ([], [])
      [x] -> ([x], [])
      x:y:xs -> let (p1, p2) = splitL xs
                in (x:p1, y:p2)
                
mSort ls =
    case ls of
      [] -> []
      [x] -> [x]
      _ -> let (p1, p2) = splitL ls
           in merge (mSort p1) (mSort p2)                
{-Proof- 
specs -        merge a b e =  e++b if a is empty;
                              e++a if b is empty;
                              [] if both empty 
                              merge z w (e++[y]++[x]) when y==x 
                              merge z b (e++[y]) when y<x
                              merge a w (e++[x]) when x>y  where a is of form (y:z) and b of (x:w)

Invariant -    At any iteration of loop say k and list a size n1 and b size n2 ,k<n1+n2 we have 
               tailMerge a b =  e++ tailMerge m n  , here e is of size k and also c is sorted
               also, length a + length b = length e + length m +length n
     
     Base Case:at k=0 we have 
               tailmerge a b=  e ++ tailMerge m n 
               we have e as empty and m n have same elements as a b 
               Thus tailmerge a b=  tailMerge m n
               Thus Base Case Proved 
     IH :      Let for any k<n1+n2 step our invariant is true 
               i.e tailmerge a b=  e ++ tailMerge m n  
     IS :      Now for any step k+1 we have 
               e' ++ tailMerge m' n' 
               i.e e' ++ lexiographic ordering of merge of m' and n'
               Now as e' is of length k+1 and m'+n' of size n1+n2-k-1
               also we have e' as of form e++[x] or e++[x]++[x]  (list form)
               Thus our equation can become e++[x]++tailMerge m' n'
               Now as per case 1 if we have head of m greater than head of n then x will be head of n 
               Thus we have e++ tailMerge m n
               Now as per case 2 if we have head of m less than head of n then x will be head of m 
               Thus we have e++ tailMerge m n
               Now as per case 2 if we have head of m equal head of n then x will be head of m and n both
               Thus we have e++ tailMerge m n
               This is same as IH for all 3 cases
               thus our inductive hypothesis hold true and we have proved tailmerge a b=  e ++ tailMerge m n

Time analysis: T(n1+n2)=      1 for n1=0 or n2=0
                              T(n1+n2-1)+1 for n1>0, n2>0
               on solving this we have general equation as T(n)=T(n1+n2-k)+k
               putting k=0 we have T(n1+n2)=O(n1+n2)
               Thus we have T(n1+n2)=O(n1+n2)
-}

