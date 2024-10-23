import System.CPUTime
import Control.DeepSeq (deepseq)

-- Simple computation for demonstration
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Function to convert picoseconds to seconds
picosecondsToSeconds :: Integer -> Double
picosecondsToSeconds ps = fromIntegral ps * 1e-12

mystery :: Num a => [a] -> a
mystery = foldr (+) 0


solved :: Num a => [a] -> a
solved [] = 0
solved (x:xs) = x + solved xs 


strange = tangled []

tangled :: [a] -> [a] -> [a]
tangled v n
    | null n = v
    | otherwise = tangled (head n : v) (tail n)


reverse_list :: [a] -> [a]
reverse_list [] = []
reverse_list (x:xs) = reverse_list xs ++ [x]



different :: Int -> [Int] -> ([Int],[Int])
different p [] = ([], [])
different p (x:xs)
    | x > p = (as, x:bs)
    | x <= p = (x:as, bs)
    where
        (as, bs) = different p xs

main :: IO ()
main = do
    start <- getCPUTime
    let result = fibonacci 35
    result `deepseq` return ()  -- Force the evaluation of result
    end <- getCPUTime
    let diff = end - start
    putStrLn $ "The result of the computation is: " ++ show result
    putStrLn $ "Computation time: " ++ show (picosecondsToSeconds diff) ++ " seconds"
