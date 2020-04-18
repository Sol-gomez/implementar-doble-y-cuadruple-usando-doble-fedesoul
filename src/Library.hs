module Library where
import PdePreludat

doble :: Number -> Number
-- doble numero = numero + numero
-- doble numero = numero * 2
doble = (2 *)   -- Aplicacion parcial

-- Funcion cuadruple de un número usando composición de funciones
cuadruple = doble . doble

--Pruebas TP1 Grupo10

type Desgaste = Number
type Patente = String
type Fecha = ( Number , Number , Number )

-- Definiciones base
anio :: Fecha -> Number
anio (_, _, year) = year

data Auto = Auto {
  patente :: Patente ,
  desgasteLlantas :: [ Desgaste ],
  rpm :: Number ,
  temperaturaAgua :: Number ,
  ultimoArreglo :: Fecha
} deriving Show

longitudEsSiete:: Patente -> Bool
longitudEsSiete = (7 ==) . length

ultimoEsCuatro:: Patente -> Bool
ultimoEsCuatro = ('4'==).last

perteneceAlRango:: Patente -> Bool
perteneceAlRango patente = patente>="DJA000" && patente<="NBZ999"
--perteneceAlRango = ("NBZ999">=) && ("DJA000"<=)

costoReparacion:: Patente -> Number
costoReparacion patente | longitudEsSiete patente         = 12500
                        | not (perteneceAlRango patente)  = 15000
                        | ultimoEsCuatro patente          = 3000 * length patente
                        | otherwise                       = 20000
{-
costoReparacion:: Patente -> Number
costoReparacion | longitudEsSiete       = 12500
                | not.perteneceAlRango  = 15000
                | ultimoEsCuatro        = 3000 * length
                | otherwise             = 20000
-}
