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

longitudEsSiete:: Patente -> Bool   -- Comprueba que la patente tenga 7 caracteres/digitos
longitudEsSiete = (7 ==) . length

ultimoEsCuatro:: Patente -> Bool    -- Comprueba que la patente finalice con 4
ultimoEsCuatro = ('4'==).last

perteneceAlRango:: Patente -> Bool  -- Comprueba que la patente este incluida en el rango pedido
perteneceAlRango patente = patente>="DJA000" && patente<="NBZ999"
--perteneceAlRango = ("NBZ999">=) && ("DJA000"<=)

costoReparacion:: Patente -> Number -- Calcula el costo de la reparacion en base a la patente del vehiculo
costoReparacion patente | longitudEsSiete patente         = 12500
                        | not (perteneceAlRango patente)  = 15000
                        | ultimoEsCuatro patente          = 3000 * length patente
                        | otherwise                       = 20000

{- Intento de simplificacion -eta conversion-
costoReparacion:: Patente -> Number
costoReparacion | longitudEsSiete       = 12500
                | not.perteneceAlRango  = 15000
                | ultimoEsCuatro        = 3000 * length
                | otherwise             = 20000
-}
