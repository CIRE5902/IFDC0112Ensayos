#!/bin/bash

# Crear el grupo
groupadd ventas

groupadd marketing

groupadd desarrollo

# Crear los usuarios y añadirlos al grupo
useradd -m -G ventas Christian
useradd -m -G ventas Khadiya
useradd -m -G ventas Andrik
useradd -m -G ventas Guillem

useradd -m -G marketing Danib
useradd -m -G marketing Didac
useradd -m -G marketing Danio
useradd -m -G marketing Joanmanel

useradd -m -G desarrollo Hector
useradd -m -G desarrollo Willy
useradd -m -G desarrollo Alex
useradd -m -G desarrollo Eric
useradd -m -G desarrollo Erik
useradd -m -G desarrollo Pol
