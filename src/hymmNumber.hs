import Prelude
import Data.List


-------------------------------
x_generator2 :: Int 
x_generator2 = length [ t | t <- ts, t `elem` g ] where 
    g = generator2 
    ts = [ ( "123" ,"21" ,"123" ,"12" ,"123" ) , ( "162" ,"26" ,"261" ,"12" ,"621" ) , ( "219" ,"19" ,"912" ,"21" ,"291" ) , ( "329" ,"92" ,"932" ,"32" ,"239" ) , ( "439" ,"94" ,"394" ,"43" ,"394" ) , ( "549" ,"95" ,"945" ,"95" ,"945" ) , ( "568" ,"68" ,"586" ,"56" ,"586" ) , ( "769" ,"67" ,"679" ,"97" ,"796" ) , ( "879" ,"79" ,"897" ,"98" ,"789" ) , ( "987" ,"79" ,"789" ,"79" ,"789" ) ]

x_tester2 :: Int 
x_tester2 = length [ t | t <- ts, tester2 t ] 
  where 
    ts = [ ( "138 " ,"01" ,"137" ,"50" ,"87" ) , ( "143" ,"01" ,"142" ,"52" ,"90" ) , ( "171" ,"02" ,"169" ,"79" ,"90" ) , ( "152" ,"03" ,"149" ,"54" ,"95" ) , ( "159" ,"04" ,"155"  ,"61" ,"94" ) , ( "161" ,"05" ,"156" ,"63" ,"93" ) , ( "182" ,"06" ,"176" ,"80" ,"96" ) , ( "151" ,"07" ,"144" ,"57" ,"87" ) , ( "165" ,"08" ,"157" ,"64" ,"93" ) , ( "174" ,"09" ,"165" ,"71" ,"94" ) ]
-------------

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

special :: String -> Bool
-- checking special has no 0's
special s
 = not ('0' `elem` s) && noDupes s

noDupes :: Eq a => [a] -> Bool
noDupes s
  = s == nub s

prime :: Int -> Bool
prime k = if k > 1 then null [ x | x <- [2..isqrt k], k `mod` x == 0] else False

perfectSquare :: Int -> Bool
perfectSquare k
 = sqrt (fromIntegral k) == fromIntegral (floor (sqrt (fromIntegral k)))

generator2 :: [(String, String, String, String)]
generator2 =
  [ (a, b, c, d)
  | a <- map show [123..987]
  , special a
  , b <- permutations a
  , c <- permutations a
  , d <- permutations a
  , noDupes [a, b, c, d]
  ]

tester2 :: (String, String, String, String) -> Bool
tester2 (a, b, c, d)
  = perfectSquare ia
   && prime (ia + ib + ic + id)
   && length (filter perfectSquare is) > 0
  where
    ia = read a
    ib = read b
    ic = read c
    id = read d
    is = map read (permutations a \\ [a,b,c,d])



-- The hymm numbers follow the following pattern: The same three, different non-zero digits in different orders.
-- The first hymm number is a perfect square



main :: IO()
main = do
  print(x_generator2)
  print(x_tester2)
  print(filter tester2 generator2)

