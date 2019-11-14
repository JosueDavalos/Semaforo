#include "semaforo.h"


int main(){
    Sem *semaforo1 = init_sem();
    Sem *semaforo2 = init_sem();

    ImprimirVia(semaforo1, semaforo2);
    setVerde(semaforo1);
    ImprimirVia(semaforo1, semaforo2);


    return 0;
}