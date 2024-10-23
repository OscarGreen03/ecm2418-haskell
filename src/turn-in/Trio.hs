import Data.List
x_generator2 :: Int
x_generator2 =
    length [t | t <- ts , t `elem` g]
    where
    g = generator2
    ts =
        [ ("123","21","123","12","123")
        , ("162","26","261","12","621")
        , ("219","19","912","21","291")
        , ("329","92","932","32","239")
        , ("439","94","394","43","394")
        , ("549","95","945","95","945")
        , ("568","68","586","56","586")
        , ("769","67","679","97","796")
        , ("879","79","897","98","789")
        , ("987","79","789","79","789")
        ]


x_tester2 :: Int
x_tester2 =
    length [t | t <- ts , tester2 t]
    where
    ts =
        [ ("138","01","137","50","87")
        , ("143","01","142","52","90")
        , ("171","02","169","79","90")
        , ("152","03","149","54","95")
        , ("159","04","155","61","94")
        , ("161","05","156","63","93")
        , ("182","06","176","80","96")
        , ("151","07","144","57","87")
        , ("165","08","157","64","93")
        , ("174","09","165","71","94")
        ]





---------------------------------------------- 

{-
Show a Haskell function generator2 that returns a list of tuples (N1, N2, N3, N4, N5)
that may be solutions to the Teaser. That is, for which, N1, N3 and N5 are three-digit
numbers, and N2 and N4 are two-digit numbers. The same three digits appear in N1,
N3 and N5, two of these digits appear in N2, and two of them appear in N4. In each
number, no digit is zero and none is repeated. The first digit of N1 is not equal to the
first digit on N2
-}


noDupes :: Eq a => [a] -> Bool
noDupes s
  = s == nub s

twoDigitNumbers :: String -> [String]
twoDigitNumbers s = [a:b:[] | a <- s, b <- s, a /= b]

generator2 :: [(String, String, String, String, String)]
generator2 =
    [ (n1, n2, n3, n4, n5) 
        | n1 <- map show [123..987]
        , n3 <- permutations n1
        , n5 <- permutations n1
        -- n2 is last 2 digits of n1, but doesn't share any digit with n1
        , n2 <- twoDigitNumbers n1
        , n4 <- twoDigitNumbers n1
        , (head n1) /= (head n2)
    ]
{-
tester2 that returns true for tuples (N1, N2, N3, N4, N5) that
are solutions to the Teaser. That is, for which N1 −N2 = N3, N3 −N4 = N5 and
N1 + N3 + N5 < 2000.-}
tester2 :: (String, String, String, String, String) -> Bool
tester2 (n1, n2, n3, n4, n5) = 
    (read n1 :: Int) - (read n2 :: Int) == (read n3 :: Int)
    && (read n3 :: Int) - (read n4 :: Int) == (read n5 :: Int)
    && (read n1 :: Int) + (read n3 :: Int) + (read n5 :: Int) < 2000



main :: IO ()
main = do
    print(filter tester2 generator2)