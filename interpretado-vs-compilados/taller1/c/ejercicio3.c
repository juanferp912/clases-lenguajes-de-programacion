#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));
    char sucursales[25][20];
    float ventas[25];
    float suma = 0;

    for (int i = 0; i < 25; i++) {
        sprintf(sucursales[i], "Sucursal %d", i + 1);
        ventas[i] = rand() % 9001 + 1000;
        suma += ventas[i];
    }

    float promedio = suma / 25;
    printf("Promedio de ventas: %.2f\n", promedio);
    printf("Sucursales sobre el promedio:\n");

    for (int i = 0; i < 25; i++) {
        if (ventas[i] > promedio) {
            printf("%s: %.2f\n", sucursales[i], ventas[i]);
        }
    }

    return 0;
}