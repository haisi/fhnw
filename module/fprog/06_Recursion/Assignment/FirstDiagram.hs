{-# LANGUAGE NoMonomorphismRestriction #-}
import System.Environment (withArgs)
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

-- Don't forget to add a type signature (:: Diagram B) to your creation
main = withArgs (words "-o diagram.svg -w 400") (defaultMain diag)
  where diag = circle 1 :: Diagram B

atopExample, besideExample, aboveExample :: Diagram B
atopExample   = fc black (square 1) `atop` circle 1
besideExample = fc black (square 1) ||| circle 1
aboveExample  = fc black (square 1) === circle 1
