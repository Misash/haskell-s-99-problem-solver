

--Problem 1
--Find the last element of a list

myLast :: [a] -> a 
myLast [] = error "Empty list , dummy!"
myLast [x] = x
myLast (_:x) = myLast x

myLast' xs = last xs  --Prelude function

--Problem 2
--Find the last but one element of a list 

--Solution with Pattern Matching
myButLast :: [a] -> a 
myButLast [] = error "Empyt List , dummy!"
myButLast [x] = error "Too feew elements"
myButLast [x,y] = x
myButLast (_:xs) = myButLast xs 

--Solution with Prelude Functions
myButLast' xs = last (init xs)

--Solution with Guards
myButLast'' :: [a] -> a 
myButLast'' list 
    | len < 2 = error "Too few elemnts!"
    | len >= 2 = reverse list !!1
    where len = length list 

--Solution with Let 
myButLast''' :: [a] -> a 
myButLast''' list =
    let len  = last (init list) 
    in  len 

--Problem 3 
-- Find the K'th element of a list

--Solution with prelude 
elementAt :: [a] -> Int -> a 
elementAt xs n = xs !! (n-1)

--Solution guards 
elementAt' :: [a] -> Int -> a 
elementAt' (x:_) 1 = x 
elementAt' (_:xs) k = elementAt' xs (k-1)
elementAt' _ _  = error "Index out of bounds"

--Problem 4
--Find the number of elements of a list 
mylength :: [a] -> Int 
mylength xs = sum [1 | x <- xs ]

--using case 
mylength' :: [a] -> Int 
mylength' xs = case xs of [] -> 0
                          (_:xs) -> 1 + mylength' xs

--Problem 5
-- Reverse a list 
myReverse :: [a] -> [a]
myReverse [] = error "Empy List ,dummy!"
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ [x]

myReverse' :: [a] -> [a]
myReverse' [] = error "Empty List!!"
myReverse' list = func list []
    where 
        func [] reversed = reversed 
        func (x:xs) reversed = func xs (x:reversed)

--Problem 6 
--Find out whether a list is a palindrome 

isPalindrome :: (Eq a) => [a] -> Bool 
isPalindrome list = 
     if myReverse' list == list  
     then True 
     else False

--Problem 7 
--Transform a list 

data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (List []) = []
flatten (Elem a) = [a]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)

--Problem 9 
{-Pack consecutive duplicates of list elements into sublists .
    if a list copntains repeated elementd they should be placed
         in separate sublists
-}

pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x:xs) = if x `elem` (head (pack xs))
              then ((x:(head (pack xs))):(tail(pack xs)))
              else [x]:(pack xs)





