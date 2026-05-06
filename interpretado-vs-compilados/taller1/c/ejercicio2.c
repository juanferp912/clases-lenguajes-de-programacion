#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));
    int pares = 0, impares = 0;

    for (int i = 0; i < 500; i++) {
        int num = rand() % 51 + 50;
        if (num % 2 == 0) {
            pares++;
        } else {
            impares++;
        }
    }

    printf("Pares: %d\n", pares);
    printf("Impares: %d\n", impares);

    return 0;
}