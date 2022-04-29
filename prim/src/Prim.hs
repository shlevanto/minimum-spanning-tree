module Prim where

import Data.Heap
import Data.Set

import Kaari

keko :: [Kaari] -> MinHeap Kaari
keko g = Data.Heap.fromList g :: MinHeap Kaari

tutki :: MinHeap Kaari -> [Kaari] -> Set Int -> [Kaari]
tutki keko puu solmut
  | keko == Data.Heap.empty = puu -- ok
  | member (alku (poll keko)) solmut &&  notMember (loppu (poll keko)) solmut = tutki (Data.Heap.drop 1 keko) (puu ++ [poll keko]) (Data.Set.insert (loppu (poll keko)) solmut)
  | member (loppu (poll keko)) solmut &&  notMember (alku (poll keko)) solmut = tutki (Data.Heap.drop 1 keko) (puu ++ [poll keko]) (Data.Set.insert (alku (poll keko)) solmut)
  | otherwise = tutki (Data.Heap.drop 1 keko) (puu) (solmut)

-- set insert, delete, member, notMember
poll :: MinHeap Kaari -> Kaari
poll keko = head $ Data.Heap.take 1 keko

prim :: [Kaari] -> [Kaari]
prim g = tutki (keko g) [] (Data.Set.fromList [alku $ poll (keko g)])
