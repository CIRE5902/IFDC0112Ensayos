

# Ejercicio de análisis exploratorio de datos

Haz una copia de la carpeta "cars" a tu area de ensayo.

Vamos a realizar un análisis exploratorio de los datos contenido en el fichero Electric_Vehicle_Population_Data.csv.

El metadata del fichero es:

|Columna | Descripcion|
|----------|-----------|
|VIN (1-10)| Partial vehicle identification number consisting of the first 10 digits.|
|County| The county where the vehicle is registered.|
|City| The city where the vehicle is registered.|
|State| The state where the vehicle is registered.|
|Postal Code| The postal code of the vehicle registration location|
|Model Year| The year the vehicle was manufactured.|
|Make| The manufacturer or brand of the vehicle.|
|Model| The specific model of the vehicle.|
|Electric Vehicle Type| Indicates whether the vehicle is a Battery Electric Vehicle (BEV) or a Plug-in Hybrid Electric Vehicle (PHEV).|
|Clean Alternative Fuel Vehicle (CAFV) Eligibility| Indicates if the vehicle is eligible for Clean Alternative Fuel Vehicle benefits.|
|Electric Range| The range of the vehicle on a full electric charge.|
|Base MSRP| The manufacturer's suggested retail price for the vehicle.|
|Legislative District| The legislative district associated with the vehicle registration location.|
|DOL Vehicle ID| Unique identifier assigned by the Washington State Department of Licensing.|
|Vehicle Location| The precise location of the vehicle.|
|Electric Utility| The electric utility company associated with the vehicle.|
|2020 Census Tract| The census tract where the vehicle is registered.|

## ¿Cuántos registros hay en el fichero?

```bash
wc -l Electric_Vehicle_Population_Data.csv
```

## ¿De cuántos estados hay vehículos registrados?

```bash
    cut -d';' -f4  Electric_Vehicle_Population_Data.csv| sort | uniq | grep -v State | wc -l
```
## ¿En que posición se encuentra la columna con el año de fabricación?

```bash
cut -d ';' -f 6 Electric_Vehicle_Population_Data.csv
```
## ¿En que año se fabricó el vehículo matriculado en Texas (TX)?

```bash
grep ";TX;" Electric_Vehicle_Population_Data.csv | cut -d ';' -f 6 | uniq
```
## ¿Cuál es el modelo de vehículo matriculado en Californía (CA)?

```bash
grep ";CA;" Electric_Vehicle_Population_Data.csv | cut -d ';' -f 8 | uniq
```
## ¿De cuántas ciudades del estado de Washigthon hay datos en el fichero?

```bash
grep ";WA;" Electric_Vehicle_Population_Data.csv | cut -d ';' -f 3 | sort | uniq | wc -l
```
## De los vehículos registrados en la ciudad de Shelton, el que tiene el mayor rango electrico, ¿cuántas millas puede recorrer?

```bash
grep "Shelton" Electric_Vehicle_Population_Data.csv | cut -d ';' -f 11 | sort -nr | head -n 1
```
## ¿Cuál es el DOL vehicle ID de ese vehículo que alcanza esa distancia máxima?

```bash
grep ";330;" Electric_Vehicle_Population_Data.csv | grep "Shelton" | cut -d ';' -f 13
```
## ¿Cuáles son los fabricantes que tienen más de 4000 vehiculos registrados?

```bash
cut -d ';' -f 7 Electric_Vehicle_Population_Data.csv | sort | uniq -c | awk '$1 > 4000'
```

## ¿Qué modelo de Nissa es lider en ventas?

```bash
grep ";NISSAN;" Electric_Vehicle_Population_Data.csv | cut -d ';' -f 8 | sort -nr | head -n 1
```

## Ordena de mayor a menor autonomía promedio a los fabricantes

```bash
awk -F ';' '{if($11!=""){print $7, $11}}' Electric_Vehicle_Population_Data.csv | sort | awk '{arr[$1]+=$2; count[$1]++} END {for (i in arr) print i, arr[i]/count[i]}' | sort -k2,2nr
```