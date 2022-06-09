# Comp305_BonusProject_14
Google Slides link: https://docs.google.com/presentation/d/1JAKnJjHMa6Pij0TdGlsACvP9KxB1DUb55LnpYHb58G4/edit?usp=sharing
## Problem Description:
  There are N boxes and box-P has the highest price
  
  Initially a contestant has a box and you have the knowledge of which boxes they will prefer/deny  when they have box-A 
  
  *Goal:* Finding a sequence that will led contestant to choose box-P


## Initial Thoughts:
  Convert given input to a graph

  Each edge (u,v) means that if contestant has box-u it will change it to box-v if it is offered. 

  Then look through all paths that if one can be finished with maximum price box P. Meaning that when arrive box-P, there should not be any other box/node that is not visited and can be accessed from it.

  This is a brute force algorithm that will check with all nodes. Since it is a fully connected graph it will take O(n^n) time.  
  
  Code: ✅
  
  Time Analysis: ✅
  
  PseudoCode: ✅ (in slides)
  
  Actual Time:
 
## Improvements on Brute Force
  There are certain cases that we can eliminate. 

  If there is a node that is favored among all of the nodes + if it is not max priced then there is no way to select best price
If max price node cannot win any other price (there is no edge (e, P)) & there is no way to achieve there
 
 -> during the build process, these directly returns IMPOSSIBLE

The nodes such that there is a edge (P, v) must be visited before achieving P. 

Although these simplifications can work in several cases, it does not bring much efficiency in a random input.

  
  Code: ✅
  
  Time Analysis: ✅
  
  PseudoCode: ✅ (in slides)
  
  Actual Time:

## Reverse Graph Idea
Another idea that comes in to mind is to start from reversing the given sequence. Meaning that assume we start from P then we try to find a sequence that offers all other boxes.

In this attempt we try to generalise a rule that goes “ask all the boxes which the contestant will refuse when holding the box in hand (let’s call it i), if none left go to a box (let’s call it j) which will be left out when offered i. Then start the rule from the top.

This approach may have flaws however. We may need a box i to eliminate the box j where the contestant prefers j over P. But with this approach we may eliminate box i hence lose a the possible solution.

Imagine this scenario: we have started from P and looking for possible boxes to go next. We divide the remaining boxes using if they are safe or not (in other words preffered to P or not) 
Then within the safe group we select a box then do the process again, this time we will have n-2 possible boxes (P and our selection).

However this idea does not simplifies the solution enough, the complexity is still similar to brute force.

  Code: 🟨
  
  Time Analysis: ✅
  
  PseudoCode: 
  
  Actual Time:

## DP Approach:
We can simplify our solution using memoization. In each step we can assume there is an starting node u in graph and a set of visited nodes. 

    DP(p, Visited{p}) = DP(u, Visited{p,u}) | u is an neighbour of p.

By solving this equation we can see if we can reach a visited list of all elements (either all of boxes or all boxes/{boxes that loses to node p})
  
  #Unique Inputs = n* 2^n
 (n= that u can take) (2^n) different subsets of n nodes

  Merge Cost = O(1)
  -> O(n* 2^n)


  Code: 
  
  Time Analysis: ✅
  
  PseudoCode: 
  
  Actual Time:

