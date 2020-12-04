-- ! Suma dos arrays

module Kata.ArrayPlusArray where

import Data.Function (on)

arrayPlusArray :: [Int] -> [Int] -> Int
arrayPlusArray = (+) `on` sum

module Kata.ArrayPlusArray where

arrayPlusArray :: [Int]->[Int]->Int
arrayPlusArray xs ys = sum(xs ++ ys)

-- ! Retorna un saludo interpolado

module Greeting where
import Text.Printf

greeting :: String -> String
greeting = printf "Hello, %s how are you doing today?"

module Greeting where

greeting name = "Hello, " ++ name ++ " how are you doing today?"


-- ! Genera un contador de horas en milisegundos

module Kata (past) where

past :: Int -> Int -> Int -> Int
past h m s = ((h * 60 + m) * 60 + s) * 1000

module Kata (past) where

past :: Int -> Int -> Int -> Int
past h m s = (h * 3600 + m * 60 + s) * 1000

-- retorna la hora

module Kata (past) where

past :: Int -> Int -> Int -> Int
past h m s = (h * 3600 + m * 60 + s) * 1000

module Kata (past) where

past :: Int -> Int -> Int -> Int
past h m s = hours h + minutes m + seconds s
	where
		hours x = 60 * minutes x
		minutes x = 60 * seconds x
		seconds x = 1000 * x

--! Determina si tu estas tocando el banjo

module Banjo where

areYouPlayingBanjo :: String -> String
areYouPlayingBanjo name@(c:_) 
	| c `elem` "rR" = name ++ " plays banjo"
	| otherwise = name ++ " does not play banjo"

module Banjo where

areYouPlayingBanjo :: String -> String
areYouPlayingBanjo name = name ++ " " ++ playStr name ++ " banjo"
	where
		playStr ('r':_) = "plays"
		playStr ('R':_) = "plays"
		playStr _ = "does not play"

--? (areYouPlayingBanjo("martin"), "martin does not play banjo");
--? (areYouPlayingBanjo("Rikke"), "Rikke plays banjo");

--! Invierte los valores

module Kata (invert) where

invert :: [Integer] -> [Integer]
invert = map negate

module Kata (invert) where

invert :: [Integer] -> [Integer]
invert = map(*(-1))

--?([1,2,3,4,5]),[-1,-2,-3,-4,-5])
--?([1,-2,3,-4,5]), [-1,2,-3,4,-5])

--! Suma los elementos dentro de un numero

module Summation where

summation :: Integer -> Integer
summation x = sum [1..x]

module Summation where

summation :: Integer -> Integer
summation n = div (n*(n + 1)) 2

--! Determina si un heroe lleva la cantidad suficiente de munición para matar al dragon

module Survive where

hero :: Int -> Int -> Bool
hero bullets dragons = bullets >= 2 * dragons

module Survive where

hero :: Int -> Int -> Bool
hero = (>=) . (`div` 2)

--?(10, 5), True)
--?(7, 4), False)
--?(4, 5), False)

--! Retorna area o perimetro dependiendo los tamaños

module AreaPerimeter where

areaOrPerimeter :: Double -> Double -> Double
areaOrPerimeter x y = if x == y then x * x else 2 * (x + y)

module AreaPerimeter where

areaOrPerimeter :: Double -> Double -> Double
areaOrPerimeter length width
  | length == width = length * width
  | otherwise = (length + width) * 2

--?(4, 4), 16)
--?(6, 10), 32)