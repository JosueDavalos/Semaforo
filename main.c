#include "semaforo.h"
#include <getopt.h>

#define DEFAULTSPEED 20 // velocidad limite predeterminada (km/h)

int main(int argc, char **argv){
    unsigned int velocidad = DEFAULTSPEED; // velocidad limite

    int opt;
    while( (opt=getopt(argc, argv, "hv:")) !=-1 ){
        switch(opt){
            case 'h':
                ayuda();
                return 1;
            case 'v':
                velocidad = atoi(optarg);
        }
    }

    printf("\nVelocidad límite en km/h: %d\n", velocidad);
    velocidad *= (10.0/36.0); // cambiamos la velocidad a m/s
    printf("Velocidad límite en m/s: %d (aproximadamente)\n", velocidad);
    printf("DUración total de ciclo en segundos: %d\n",CICLO);

    Sem *semaforo1 = init_sem();
    Sem *semaforo2 = init_sem();

    // imprimirVia(semaforo1, semaforo2);
    // setVerde(semaforo1);
    // imprimirVia(semaforo1, semaforo2);

    empezarCiclo(semaforo1, semaforo2, velocidad);
    return 0;
}

void imprimirVia(Sem *sem1, Sem *sem2){
    printf("\n            Semaforo 1      Semaforo 2\n");
    printf("Rojo:     \t%d\t\t%d\n", sem1->rojo, sem2->rojo);
    printf("Amarillo: \t%d\t\t%d\n", sem1->amarillo, sem2->amarillo);
    printf("Verde:    \t%d\t\t%d\n", sem1->verde, sem2->verde);
    
}

void ayuda(){
	printf("Semaforo de dos vias. El tiempo de duracion del amarillo depende de la velocidad de la carretera.\n");
	printf("Usos: \n");
	printf("   semaforo [-v] <velocidad>\n");
	printf("   semaforo -h\n");
	printf("Opciones:\n   -v Velocidad en Km/h\n   -h Mostrar informacion de ayuda\n");
}