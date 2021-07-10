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

--! Repite un string determinada cantidad de veces

module StringRepeat where

repeatStr :: Int -> String -> String
repeatStr n = concat . replicate n

module StringRepeat where

repeatStr :: Int -> String -> String
repeatStr n s = concat $ replicate n s


--?(4, 'a'), 'aaaa')
--?(3, 'hello '), 'hello hello hello ')

--! Retorna un falso binario

module Codewars.Kata.FakeBinary where

fakeBin :: String -> String
fakeBin = map (\c -> if c < '5' then '0' else '1' )

module Codewars.Kata.FakeBinary where

import Data.Char (digitToInt)

fakeBin :: String -> String
fakeBin [] = []
fakeBin (x:xs)
  | digitToInt x < 5 = '0' : fakeBin xs
  | digitToInt x > 4 = '1' : fakeBin xs

--?["01011110001100111", "45385593107843568"],
--?["101000111101101", "509321967506747"],
--?["011011110000101010000011011", "366058562030849490134388085"],

--! Retorna si un numero es divisible entre otros dos

module Kata (isDivisible) where

isDivisible :: Int -> Int -> Int -> Bool
isDivisible n x y = (n `mod` x + n `mod` y == 0)

module Kata (isDivisible) where

isDivisible :: Int -> Int -> Int -> Bool
isDivisible x y z = mod x y == 0 && mod x z == 0

--?(3,3,4),False)
--?(12,3,4),True)
--?(8,3,4),False)

--! Obtiene un planeta por su numero en el sistema solar

module Planets where

getPlanetName :: Int -> String
getPlanetName index = planets !! (index - 1)
  where planets :: [String]
        planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

module Planets where

getPlanetName :: Int -> String
getPlanetName index = planets !! (index - 1)
  where planets :: [String]
        planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

--! Abrevia un nombre

module Initials where

import Data.Char
import Data.List

getInitials :: String -> String
getInitials = intersperse '.' . map (toUpper . head) . words

module Initials where

import Data.List (head, intersperse, words)
import Data.Char (toUpper)

getInitials :: String -> String
getInitials = intersperse '.' . map (toUpper . head) . words

#?Sam Harris => S.H
#?Patrick Feeney => P.F

--! Alterna mayusculas y minusculas

module Codewars.Kata.AlternatingCase where

import Data.Char(isLower, toUpper, toLower)

toAlternatingCase :: String -> String
toAlternatingCase = map (\x -> if isLower x then toUpper x else toLower x)

module Codewars.Kata.AlternatingCase where

import Data.Char

toAlternatingCase :: String -> String
toAlternatingCase = map f
  where f c | isUpper c = toLower c
            | isLower c = toUpper c
            | otherwise = c

--? Mauricio => mAURICIO

--! Muestra si un string está en uppercase

module Codewars.Kata.IsUpperCase where
import Data.Char (isLower)

isUpperCase :: String -> Bool
isUpperCase = all (not . isLower)

module Codewars.Kata.IsUpperCase where

import Data.Char (isLower)

isUpperCase :: String -> Bool
isUpperCase = not . any isLower

#?is_uppercase("hello I AM DONALD") == False
#?is_uppercase("HELLO I AM DONALD") == True
#?is_uppercase("ACSKLDFJSgSKLDFJSKLDFJ") == False

--! Invierte las palabras dentro de una sentencia

module ReverseWords where

reverseWords :: String -> String
reverseWords = unwords . reverse . words

module ReverseWords where

reverseWords :: String -> String
reverseWords = unwords . reverse . words

--(reverseWords("hello world!"), "world! hello")
--(reverseWords("yoda doesn't speak like this" ),  "this like speak doesn't yoda")
--(reverseWords("foobar"                       ),  "foobar")
-- (reverseWords("kata editor"                  ),  "editor kata")

--! Retorna una simple formula

module CoefficientsOfTheQuadraticEquation (quadratic) where

quadratic :: Int -> Int -> (Int,Int,Int)
quadratic a b = (1, -a-b, a*b)

--! Si el string es alligator retorna un 'small' si no un 'wide'

module Kata (mouthSize) where
import  Data.Char

mouthSize :: String -> String
mouthSize x | "alligator" == map toLower x = "small"
            | otherwise                    = "wide"

module Kata (mouthSize) where
import Data.Bool
import Data.Char

mouthSize :: String -> String
mouthSize = bool "wide" "small" . (=="alligator") . map toLower

#! Retorna la suma de todos los elementos de un array sin importar que sea un string

module Mixed where

sumMix :: [Either String Int] -> Int
sumMix = sum . map (either read id)

module Mixed where

sumMix :: [Either String Int] -> Int
sumMix = sum . map (either read id)

#! Retorna la suma de un array

module Sum where
import Prelude hiding (sum)

import Data.Foldable

sum :: Num a => [a] -> a
sum = foldl' (+) 0

module Sum where
import Prelude hiding (sum)

sum :: Num a => [a] -> a
sum = foldl (+) 0

#! Recibe un numero y cuenta a partir de el

module Codewars.Kata.Monkeys where

monkeyCount :: Int -> [Int]
monkeyCount x = [1..x]

module Codewars.Kata.Monkeys where

monkeyCount :: Int -> [Int]
monkeyCount = enumFromTo 1

# (5), [1, 2, 3, 4, 5])
# (3), [1, 2, 3])
# (9), [1, 2, 3, 4, 5, 6, 7, 8, 9])


#! Devuelve el array recibido multiplicado por 2

module Codewars.Kata.LostWithout where

maps :: [Int] -> [Int]
maps = map (*2)

module Codewars.Kata.LostWithout where
maps :: [Int] -> [Int]
maps = fmap (*2)


# ! Retorna dependiendo la cantidad de 'Goods ' en un array si una idea es buena o mala

module Well where

well :: [String] -> String
well x
  | l == 0 = "Fail!"
  | l <= 2 = "Publish!"
  | otherwise = "I smell a series!"
  where l = length (filter (== "good") x)

module Well where

well :: [String] -> String
well xs
  | goodIdeasNum == 0 = "Fail!"
  | goodIdeasNum <= 2 = "Publish!"
  | otherwise = "I smell a series!"
    where goodIdeasNum = foldl (\acc x -> if  x == "good" then (acc+1) else acc) 0 xs

# ! Elimina los espacios dentro de un string

module Kata (noSpace) where

noSpace :: String -> String
noSpace = filter (/=' ')

module Kata (noSpace) where

import Data.Char (isSpace)

noSpace :: String -> String
noSpace = filter (not . isSpace)

#! Si un un booleano pasado es true se llama a alguna funcion

module If where

_if :: Bool -> a -> a -> a
_if True x _ = x
_if False _ y = y

module If where

_if :: Bool -> a -> a -> a
_if b x y = if b then x else y


#! Escapa la variable! si el bonus es true se retorna un salario * 10

module Bonus where

iHazBonus :: Float->  Bool -> String

iHazBonus salary bonus = "$" ++ (show money)
  where
  money
    | bonus == True = salary * 10
    | otherwise = salary

module Bonus where

iHazBonus :: Float->  Bool -> String

iHazBonus salary bonus = '$' : show (salary * if bonus then 10 else 1)

#! Retorna un string con el ascii y recibe un numero

module Ascii where

getChar' :: Int -> Char
getChar' = toEnum

#! Condiverte numeros a estring los suma y los devuelve como string

module Kata (sumStr) where

sumStr :: String -> String -> String
sumStr a b = show(readInt(a) + readInt(b))

readInt :: String -> Int
readInt "" = 0
readInt s = read s

module Kata (sumStr) where

import Data.Function (on)
import Data.Maybe (fromMaybe)
import Text.Read (readMaybe)

sumStr :: String -> String -> String
sumStr = (show .) . (+) `on` (fromMaybe 0 . readMaybe)

# sumSTr('9', '') -> 0
# sumSTr('10', '10') -> 20

#! Retorna si un numero es par o impar

module EvenOrOdd where

evenOrOdd :: Integral a => a -> [Char]
evenOrOdd n
  | even n = "Even"
  | otherwise = "Odd"

module EvenOrOdd where

evenOrOdd :: Integral a => a -> [Char]
evenOrOdd n = if even n then "Even" else "Odd"

#! Retrona cuantas veces aparece un elemento en un array

module Codewars.Kata.Sheep where

countSheep :: [Bool] -> Int
countSheep = length . filter id

module Codewars.Kata.Sheep where

countSheep :: [Bool] -> Int
countSheep = length . filter (==True)

#! Cconvierte un booleano a texto 'si' o 'no'

module YesNo where

boolToWord :: Bool -> String
boolToWord True = "Yes"
boolToWord False = "No"

-- ! Filtra si un elemento de una lista se encuentra dentro de otra

module GooseFilter where

geese = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]

gooseFilter :: [String] -> [String]
gooseFilter = filter (`notElem` geese)

module GooseFilter where

import Data.List

geese = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]

gooseFilter :: [String] -> [String]
gooseFilter a = ( a \\ (a `intersect` geese))

-- ! Cuenta ovejas dependiendo de el numero que se le pase

module CountSheep where

countSheep :: Int -> String
countSheep = concat . map (\x -> show x ++ " sheep...") . enumFromTo 1

module CountSheep where

countSheep :: Int -> String
countSheep n
  | n == 0 = ""
  | otherwise = countSheep (n-1) ++ show n ++ " sheep..." 

#! Remplaza las letras "T" por "U"

module DnaToRna where 

dnaToRna :: String -> String 
dnaToRna = map (\c -> if c == 'T' then 'U' else c)

module DnaToRna where 

dnaToRna :: String -> String 
dnaToRna [] = []
dnaToRna ('T' : xs) = 'U' : dnaToRna xs
dnaToRna (x : xs) = x : dnaToRna xs

module DnaToRna where 

trans :: Char -> Char
trans 'T' = 'U'
trans  ch =  ch

dnaToRna :: String -> String 
dnaToRna = map trans

#! Recibe un input numero y retorna un string de "01010" de el tamaño de el numbero

module Codewars.Stringifier where

stringy :: Int -> String
stringy n = take n $ cycle "10"

module Codewars.Stringifier where

stringy :: Int -> String
stringy n = take n (cycle "10")

-- ! COnvierte un numero a un string

module Stringify where

numberToString :: Int -> String
numberToString num = show num

#! Repite un string determinada cantidad de veces

module Codewars.Exercises.RepeatIt where

repeatIt :: String -> Int -> String
repeatIt str n = concat $ replicate n str

module Codewars.Exercises.RepeatIt where

repeatIt :: String -> Int -> String
repeatIt = (concat .) . flip replicate

-- TODO 1246

module Maskify where

maskify :: String -> String
maskify str = replicate l '#' ++ drop l str
    where l = length str - 4

module Maskify where

maskify :: String -> String
maskify s
  | length s < 5 = s
  | otherwise = "#" ++ maskify (tail s)

-- TODO 1 1333

module Codewars.Kata.DNA where
import Codewars.Kata.DNA.Types

-- data Base = A | T | G | C
type DNA = [Base]

complementNucleo :: Base -> Base
complementNucleo A = T
complementNucleo T = A
complementNucleo C = G
complementNucleo G = C

dnaStrand :: DNA -> DNA
dnaStrand = map complementNucleo

module Codewars.Kata.DNA where
import Codewars.Kata.DNA.Types

-- data Base = A | T | G | C
type DNA = [Base]

dnaStrand :: DNA -> DNA
dnaStrand = map $ \b -> case b of
  A -> T
  T -> A
  C -> G
  G -> C

-- TODO 1 1547 Cuenta elementos en un array y retorna respuesta dependiendo el conteo

module Crap where

type Garden = [String]

crap :: Garden -> Int -> Int -> String
crap garden bags cap  | 0 < length (filter (=='D') (concat garden))          = "Dog!!"
                      | bags * cap < length (filter (=='@') (concat garden)) = "Cr@p"
                      | otherwise

module Crap where

type Garden = [String]

crap :: Garden -> Int -> Int -> String
crap xss bags capacity
  | any (elem 'D') xss = "Dog!!"
  | length (concatMap (filter (=='@')) xss) <= bags * capacity = "Clean"
  | otherwise = "Cr@p"

module Crap where

type Garden = [String]

crap :: Garden -> Int -> Int -> String
crap str bags cap
 | elem 'D' garden = "Dog!!"
 | bags * cap < (length . filter (== '@') $ garden) = "Cr@p"
 | otherwise = "Clean"
 where garden = concat str

-- TODO 1 1593 Ordena las palabras alfabeticamente por su letra final

module SortBy where

import Data.List (sortOn)

last' :: String -> [String]
last' = sortOn last . words


module SortBy where

import Data.List (sortBy)

last' :: String -> [String]
last' = sortBy (\x y -> compare (last x) (last y)) . words

-- TODO 1 1616  Remplaza las vocales por su posicion dentro de el string

module Switcheroo where

vowel2Index :: String -> String
vowel2Index = concat . zipWith replace [1..] where
  replace i c
    | c `elem` "aeiouAEIOU" = show i
    | otherwise = [c]

module Switcheroo where

vowel2Index :: String -> String
vowel2Index = go 1 where
  go i w=case w of { []->[]; x:xs->(if elem x "AEIOUaeiou" then show i else x:[])++go (i+1) xs; }

module Switcheroo where

import Data.Char

isVowel :: Char -> Bool
isVowel c = toLower c `elem` "aeiou"

vowel2Index :: String -> String
vowel2Index = concatMap f . zip (concat . repeat $ [1 .. ])
  where
    f :: (Int, Char) -> String
    f (i, c) | isVowel c = show i
             | otherwise = [c]