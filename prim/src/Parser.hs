module Parser where

import Data.Aeson

data Node = Node {id :: Int, xloc :: Int, yloc :: Int, edges :: [(Int, Int)]}

instance FromJSON Node

foo :: Object v -> Node
foo v = 