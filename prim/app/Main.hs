module Main where

import Prim

main :: IO ()
main = do
  let s1 = Kaari 1 2 2 100
  let s2 = Kaari 1 3 101 101
  let s3 = Kaari 2 3 2 102
  
  let g = [s1, s2, s3]
  
  putStrLn $ show (alku $ head g)
  putStrLn $ show (prim g)

