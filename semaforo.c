#include "semaforo.h"
#include <time.h>

#ifdef _WIN32
#include <Windows.h>
#else
#include <unistd.h>
#endif

#define TIEMPO_REACCION 1 // tiempo de reaccion del conductor (usualmente es 1 s)
#define TASA_DESACELERACION 3 // tasa de desaceleracion (usualmente es 3.00 m/s2)
#define LONGITUD_VEHICULO 6 // valor sugerido para el promedio de longitud de vehiculos (6.10 m)
#define ANCHO_VIA 10 // ancho de la via (valor sugerido 10 m)

Sem *init_sem() {
		Sem *sem = malloc(sizeof (Sem));
		sem->verde = 0;
		sem->amarillo = 0;
		sem->rojo =0;
		return sem;
}

void setVerde(Sem *sem){
    sem->verde = 1;
	sem->amarillo = 0;
	sem->rojo =0;
}

void setAmarillo(Sem *sem){
    sem->verde = 0;
	sem->amarillo = 1;
	sem->rojo =0;
}

void setRojo(Sem *sem){
    sem->verde = 0;
	sem->amarillo = 0;
	sem->rojo =1;
}

void liberar_sem(Sem *sem){
    free(sem);
}

unsigned int tiempoAmarillo(unsigned int velocidad_limite){
    return (TIEMPO_REACCION + velocidad_limite/(2*TASA_DESACELERACION));
}

unsigned int tiempoRojo(unsigned int velocidad_limite){
    return (CICLO/2) + (LONGITUD_VEHICULO+ANCHO_VIA)/velocidad_limite - 1;
}


unsigned int tiempoVerde(unsigned int velocidad_limite){
    return CICLO - tiempoAmarillo(velocidad_limite) - tiempoRojo(velocidad_limite);
}

void empezarCiclo(Sem *sem1, Sem *sem2, unsigned int velocidad_limite){
    unsigned int tiempo_verde = tiempoVerde(velocidad_limite);
    unsigned int tiempo_amarillo = tiempoAmarillo(velocidad_limite);

    printf("Tiempo Rojo: %d segundos\nTiempo Amarillo: %d segundos\nTiempo Verde: %d segundos\nEmpezamos el ciclo:\n",tiempo_verde + tiempo_amarillo, tiempo_amarillo, tiempo_verde);
    while(1){
        // Empezamos poniendo el semaforo 1 en rojo y el semaforo 2 en verde
        setRojo(sem1);
        setVerde(sem2);
        imprimirVia(sem1,sem2);
        sleep(tiempo_verde);

        setAmarillo(sem2);
        imprimirVia(sem1,sem2);
        sleep(tiempo_amarillo);

        setRojo(sem2);
        setVerde(sem1);
        imprimirVia(sem1,sem2);
        sleep(tiempo_verde); 

        setAmarillo(sem1);
        imprimirVia(sem1,sem2);
        sleep(tiempo_amarillo);
    }
}

void tiempoEspera(unsigned int segundos){
    // Convertimos los segundos a milisegundos
    int ms = 1000 * 1000 * segundos; 
  
    // Inicializamos un tiempo de inicio
    clock_t start_time = clock(); 
  
    // Iteramos hasta que el tiempo actual sea mayor o igual al tiempo requerido (inicial + milisegundos)
    while (clock() < start_time + ms); 
}
