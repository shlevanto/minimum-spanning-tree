module Kaari where

-- Kaari on tietorakenne, jolla on alku, loppu ja paino
data Kaari = Kaari Int Int Int Int
  deriving (Show)

instance Ord Kaari where
  compare (Kaari _ _ p1 _) (Kaari _ _ p2 _) = compare p1 p2

instance Eq Kaari where
  (==) k m = 
    (alku k) == (loppu m)       ||
    (alku m) == (loppu k)       ||
    (alku k) == (alku m)        ||
    (loppu k) == (loppu m)      ||
    (kaariId k) == (kaariId m)

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
