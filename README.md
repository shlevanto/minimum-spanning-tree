# minimum-spanning-tree
[Bitwise koodipähkinä 2/3](https://bitwise.fi/koodipahkina/?fbclid=IwAR0RyvzvN2_8Z8UscKWj_mgoU75B1qPbVnOVKheFOfrwY6xMVo7h6KuYbfM) ratkaisu Haskellilla.

Tee kaarien vertailu näin:
```
data Edge = Edge Int Int Int
  deriving Show

instance Ord Edge where
  compare (Edge _ _ w1) (Edge _ _ w2)  = compare w1 w2  

instance Eq Edge where
  (Edge s1 u1 w1) == (Edge s2 u2 w2) = s1 == s2 && u1 == u2 && w1 == w2
```
