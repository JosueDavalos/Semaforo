#include "semaforo.h"
#include <getopt.h>

int main(int argc, char **argv){
    int velocidad =20;

    int opt;
    while( (opt=getopt(argc, argv, "hv:")) !=-1 ){
        switch(opt){
            case 'h':
                help();
                return 1;
            case 'v':
                velocidad = atoi(optarg);
        }
    }

    printf("Velocidad: %d", velocidad);

    Sem *semaforo1 = init_sem();
    Sem *semaforo2 = init_sem();

    ImprimirVia(semaforo1, semaforo2);
    setVerde(semaforo1);
    ImprimirVia(semaforo1, semaforo2);


    return 0;
}