#include <unistd.h>
#include <stdio.h>
#define TIEMPO_REACCION 1 // tiempo de reaccion del conductor (usualmente es 1 s)
#define TASA_DESACELERACION 3 // tasa de desaceleracion (usualmente es 3.00 m/s2)
#define LONGITUD_VEHICULO 6 // valor sugerido para el promedio de longitud de vehiculos (6.10 m)
#define ANCHO_VIA 10 // ancho de la via (valor sugerido 10 m)
#define CICLO 40

unsigned int tiempoAmarillo(unsigned int velocidad_limite){
    return (TIEMPO_REACCION + velocidad_limite/(2*TASA_DESACELERACION));
}

unsigned int tiempoRojo(unsigned int velocidad_limite){
    return (CICLO/2) + (LONGITUD_VEHICULO+ANCHO_VIA)/velocidad_limite - 1;
}


unsigned int tiempoVerde(unsigned int velocidad_limite){
    return CICLO - tiempoAmarillo(velocidad_limite) - tiempoRojo(velocidad_limite);
}

void imprimirSem(int sem){
    if(sem == 0)
        printf("Verde\n");
    else if(sem == 1)
        printf("Amarillo\n");
    else
        printf("Rojo\n");
}

void imprimirVia(int sem1, int sem2){
    printf("\nSemaforo 1: ");
    imprimirSem(sem1);
    printf("Semaforo 2: ");
    imprimirSem(sem2);
}

void empezarCiclo(unsigned int velocidad_limite){
    unsigned int tiempo_verde = tiempoVerde(velocidad_limite);
    unsigned int tiempo_amarillo = tiempoAmarillo(velocidad_limite);
    // Empezamos poniendo el semaforo 1 en rojo y el semaforo 2 en verde
    // rojo = 2, amarillo = 1, verde = 0
    int sem1 = 2;
    int sem2 = 0;

    printf("Tiempo Rojo: %d segundos\nTiempo Amarillo: %d segundos\nTiempo Verde: %d segundos\nEmpezamos el ciclo:\n",tiempo_verde + tiempo_amarillo, tiempo_amarillo, tiempo_verde);
    while(1){
        imprimirVia(sem1,sem2);
        sleep(tiempo_verde);

        sem2++;
        imprimirVia(sem1,sem2);
        sleep(tiempo_amarillo);

        sem2++;
        sem1-=2;
        imprimirVia(sem1,sem2);
        sleep(tiempo_verde); 

        sem1++;
        //imprimirVia(sem1,sem2);
        sleep(tiempo_amarillo);
        
        sem1++;
        sem2-=2;
        imprimirVia(sem1,sem2);
        sleep(tiempo_verde); 
    }
}

int main()
{
    empezarCiclo(40);
}
