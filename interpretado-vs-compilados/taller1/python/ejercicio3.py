#Genere 2 arreglos paralelos que representen las sucursales de una empresa y sus ventas. 
# Existen 25 sucursales en la empresa. 
# Presente el promedio de ventas, así como las sucursales con ventas mayores al promedio.

import random

sucursales = []
ventas = []

for i in range(25):
    sucursales.append("Sucursal " + str(i + 1))
    ventas.append(random.randint(1000, 5000))

suma_total = 0
for v in ventas:
    suma_total += v

promedio = suma_total / len(ventas)
print("Promedio de ventas:", promedio)
print("Sucursales que superan el promedio:")

for i in range(len(ventas)):
    if ventas[i] > promedio:
        print(sucursales[i], "-", ventas[i])