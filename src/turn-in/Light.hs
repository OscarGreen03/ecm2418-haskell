import Prelude
import Data.List
-----------------------
x_tester1 :: Int
x_tester1 =
  length [ t | t <- ts , tester1 t ]
  where
  ts =
    [ ( 6 ,59 ,17 ,24)
    , ( 6 ,59 ,17 ,34)
    , ( 6 ,59 ,27 ,14)
    , ( 6 ,59 ,27 ,41)
    , ( 8 ,59 ,12 ,46)
    , (16 ,59 , 7 ,24)
    , (16 ,59 , 7 ,42)
    , (16 ,59 , 7 ,43)
    , (16 ,59 ,27 ,40)
    , (18 ,59 , 2 ,46)
    ]


x_generator1 :: Int
x_generator1 =
  length [ t | t <- ts , t `elem` g ]
  where
  g = generator1
  ts =
    [ ( 2 ,15 ,14 ,11)
    , ( 4 ,31 ,27 , 9)
    , ( 6 ,47 ,10 , 8)
    , ( 9 , 3 ,23 , 6)
    , (11 ,19 , 6 , 5)
    , (13 ,35 ,19 , 3)
    , (15 ,51 , 2 , 2)
    , (18 , 6 ,16 ,12)
    , (20 ,22 ,29 ,10)
    , (22 ,38 ,11 , 9)
    ]


-------------------

noDupes :: Eq a => [a] -> Bool
noDupes s
  = s == nub s

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

prime :: Int -> Bool
prime k = if k > 1 then null [ x | x <- [2..isqrt k], k `mod` x == 0] else False


digitSegments :: Int -> Int
digitSegments n
  | n == 0 = 6
  | n == 1 = 2
  | n == 2 = 5
  | n == 3 = 5
  | n == 4 = 4
  | n == 5 = 5
  | n == 6 = 6
  | n == 7 = 3
  | n == 8 = 7
  | n == 9 = 6
  | otherwise = 0

digits :: Int -> [Int]
digits 0 = [0]
-- unfoldr performs the lambda function on n until it returns Nothing, then it returns the list of Just values
digits n = unfoldr (\x -> if x == 0 then Nothing else Just (x `mod` 10, x `div` 10)) n

numberSegments :: Int -> Int
numberSegments n =
  sum (map digitSegments (digits (n)))

totalSegments :: (Int, Int, Int, Int) -> Int
totalSegments (a, b, c, d) = 
  sum (map numberSegments [a,b,c,d] ) + ((8 - length (concat (map show [a, b, c, d]))) * 6)





-- A tuple (HR, MN , DY , MT) is “magic” if the displayed digits of HR, MN, DY
-- and MT are all be different, and the total number of lit segments in the display is prime.
magic :: (Int, Int, Int, Int) -> Bool
magic (hr, mn, dy, mt)
-- no duplicates
  = noDupes [hr, mn, dy, mt]
  -- number summed is a prime
    && prime (totalSegments (hr, mn, dy, mt))
    -- adding extra segments for additional digits not specified by 0




generator1 :: [(Int, Int, Int, Int)]
generator1 = [ (a, b, c, d)
  | a <- [0..23]
  , b <- [0..59]
  , c <- [0..31]
  , d <- [0..12]
  ]





incrementDay :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
incrementDay (hr, mn, dy, mt)
  | dy == 31 && mt == 12 = (hr, mn, 1, 1)
  | dy == 31 = (hr, mn, 1, mt+1)
  | otherwise = (hr, mn, dy+1, mt)

incrementMinute :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
incrementMinute (hr, mn, dy, mt)
  -- have to handle if last min of last day of last month
  | hr == 23 && mn == 59 && dy == 31 && mt == 12 = (0, 0, 1, 1)
  -- have to handle if last min of last day of month
  | hr == 23 && mn == 59 && dy == 31 = (0, 0, 1, mt+1)
  -- have to handle if last min of last hour
  | hr == 23 && mn == 59 = (0, 0, dy+1, mt)
  -- have to handle if last min of day
  | mn == 59 = (hr+1, 0, dy, mt)
  | otherwise = (hr, mn+1, dy, mt)


-- for which the tuple is “magic”, a second tuple exactly
-- one day later is also “magic”, and just one minute on from this second tuple the number
-- of lit segments on the display is the average of the number of lit segments of these two
-- tuples.
tester1 :: (Int, Int, Int, Int) -> Bool
tester1 (hr, mn, dy, mt)
  = magic (hr,mn,dy,mt) && magic (incrementDay (hr,mn,dy,mt))
  -- and 1 min on from second tuple, number of segments is average num of the two
  && ((((totalSegments (hr,mn,dy,mt) + totalSegments (incrementDay (hr,mn,dy,mt))) `div` 2) 
  == totalSegments (incrementDay(incrementMinute(hr,mn,dy,mt))) ))




main :: IO ()
main = do
  print(x_tester1)
  print(x_generator1)
  print(filter tester1 generator1)