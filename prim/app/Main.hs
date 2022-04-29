module Main where

import Prim
import Kaari

main :: IO ()
main = do
  let s1 = Kaari 1 2 2 12
  let s2 = Kaari 1 3 4 14
  let s3 = Kaari 2 3 1 23
  let s4 = Kaari 2 4 2 24
  let s5 = Kaari 3 5 7 35
  let s6 = Kaari 4 5 5 45
  
  let g = [s1, s2, s3, s4, s5, s6]
  
  -- putStrLn $ show (keko g)
  putStrLn $ show (prim g)

