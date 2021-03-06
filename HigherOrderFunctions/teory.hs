
--Funciones Currificadas

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100 

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

--Funciones Infijas (secciones)

divideByTen :: (Floating a) => a  -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

--Funciones de orden Superior

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = []
-- map f (x:xs) = f x : map f xs

-- filter :: (a -> Bool) -> [a] -> [a]
-- filter _ [] = []
-- filter p (x:xs)
--     | p x       = x : filter p xs
--     | otherwise = filter p xs


largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

--Lambdas





