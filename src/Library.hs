module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero * 2

cuadruple = doble . doble