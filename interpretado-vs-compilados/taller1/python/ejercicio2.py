import random as r

def generar_valores():
    valores = []
    for i in range(500):
        valor = r.randint(50, 100)
        valores.append(valor)
    return valores

def contar_paridad():
    valores = generar_valores()
    pares = 0
    impares = 0
    
    for v in valores:
        if v % 2 == 0:
            pares += 1
        else:
            impares += 1
            
    return pares, impares

p, i = contar_paridad()
print(f"Valores pares generados: {p}")
print(f"Valores impares generados: {i}")