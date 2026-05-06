#include <stdio.h>

int main() {
    float num, suma = 0;

    for (int i = 0; i < 10; i++) {
        printf("Ingrese valor %d: ", i + 1);
        scanf("%f", &num);
        suma += num;
    }

    printf("Suma: %.2f\n", suma);
    printf("Promedio: %.2f\n", suma / 10);

    return 0;
}