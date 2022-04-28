module Prim where

import Data.Heap
import Data.Set

-- Kaari on tietorakenne, jolla on alku, loppu ja paino
data Kaari = Kaari Int Int Int Int
  deriving (Show, Eq)

instance Ord Kaari where
  Kaari a1 l1 p1 id1 <= Kaari a2 l2 p2 id2
    | p1 < p2     = True
    | p1 > p2     = False
    | otherwise   = p1 == p2  

alku :: Kaari -> Int
alku (Kaari a l p id) = a

loppu :: Kaari -> Int
loppu (Kaari a l p id) = l

paino :: Kaari -> Int
paino (Kaari a l p id) = p

kaariId :: Kaari -> Int
kaariId (Kaari a l p id) = id

vastaKaari :: Kaari -> Kaari
vastaKaari (Kaari a l p id) = Kaari l a p id

-- pienin virittävä puu
-- 1. Funktio ottaa annetun juuren ja lisää sen puulistaukseen
-- 2. Lisätään kaikki juuren kaaret kekoon
-- 3. Aina keon ensimmäiselle kaarelle: jos molemmat kaaren solmut puussa -> skippaa, jos toinen -> lisää puuhun

keko :: [Kaari] -> MinHeap Kaari
keko g = Data.Heap.fromList g :: MinHeap Kaari

tutki :: MinHeap Kaari -> [Kaari] -> Set Int -> [Kaari]
tutki keko puu solmut
  | keko == Data.Heap.empty = puu 
  | member (alku (poll keko)) solmut &&  notMember (loppu (poll keko)) solmut = tutki (Data.Heap.drop 1 keko) (puu ++ [poll keko]) (Data.Set.insert (loppu (poll keko)) solmut)
  | member (loppu (poll keko)) solmut &&  notMember (alku (poll keko)) solmut = tutki (Data.Heap.drop 1 keko) (puu ++ [poll keko]) (Data.Set.insert (alku (poll keko)) solmut)
  | otherwise = tutki (Data.Heap.drop 1 keko) (puu) (solmut)

-- set insert, delete, member, notMember
poll :: MinHeap Kaari -> Kaari
poll keko = head $ Data.Heap.take 1 keko

prim :: [Kaari] -> [Kaari]
prim g = tutki (keko g) [] (Data.Set.fromList [(alku $ head g)])
