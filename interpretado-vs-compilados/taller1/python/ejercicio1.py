#Ingresar 10 valores por teclado. Presentar la suma y promedio
arreglo = []
for i in range(10):
    numero = int(input("ponga un numero: "))
    arreglo.append(numero)
promedio = sum(arreglo)/10
print(promedio)
