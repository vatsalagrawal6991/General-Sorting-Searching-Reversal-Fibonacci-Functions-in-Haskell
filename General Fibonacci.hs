import System.Random (randomRs,mkStdGen)
{-///////////////////////////////////////////////////////////////////////////////////////////////////////
********************Problem 1 - Listing and Sorting*****************************************
-}

{-******************************************************************************************
1.3) Tail recursive Fibonnaci 
-}

tailFibo n     | n==0 = 0
               | n==1 = 1
               | otherwise = fibo n 1 2 1

fibo n b c d = if c==n
               then d
               else fibo n d (c+1) (d+b)

{-Proof- 
specs -        fibbo n b c d =d if c==n;
                              fibo n d (c+1) (d+b) otherwise; 

Invariant -    At any iteration of loop say k and number n ,k<n we have 
               tailFibo n =  x*fibo(k)+y*fibo(k-1) here x and y are some varable integer which increase as k increase
               or in simple words tailFibo k+1 = tailFibo K + tailFibo k-1
               Note tailFibo(k)=d and tailFibo(k-1)=b
     
     Base Case:at k=1 we have 
               tailFibo k+1 = tailFibo K + tailFibo k-1
               tailFibo k+1 = 1
               tailFibo K + tailFibo k-1 = 0 +1=1
               Thus tailFibo k+1 = tailFibo K + tailFibo k-1
               Thus Base Case Proved 
     IH :      Let for any k<n step our invariant is true 
               i.e tailFibo n =  x*tailFibo(k)+y*tailFibo(k-1)
               and   tailFibo k+1 = tailFibo K + tailFibo k-1
     IS :      Now for any step k+1 we have 
               tailFibo n =  x'*tailFibo(k+1)+y'*tailFibo(k)
               and   tailFibo k+2 = tailFibo K + tailFibo k+1 
               Now x'*tailFibo(k+1)+y'*tailFibo(k)=x'*(tailFibo(k)+tailFibo(k-1))+y'*tailFibo(k)
               = (x'+y')tailFibo(k)+x'tailFibo(k-1)
               This is same as IH tailFibo n =  x*tailFibo(k)+y*tailFibo(k-1)
               thus our inductive hypothesis hold true and we have proved

Time analysis: T(n)=     1 for n=0
                         T(n-1)+1 for n>0
               on solving this we have general equation as T(n)=T(n-k)+k
               putting k=0 we have T(n)=O(n)
               Thus we have T(n)=O(n)
-}

