#include <stdlib.h>
#include <stdio.h>

#define CICLO 40 // numero de segundos que dura el ciclo de un semaforo

/*********************** ESTRUCTURA SEMAFORO **********************/
typedef struct semaforo {
	int verde;
	int amarillo;
	int rojo;
}Sem;

/*********************** FUNCIONES DE SEMAFORO **********************/
Sem *init_sem(); // inicializar un semaforo
void setVerde(Sem *sem); // prender solamente la luz verde
void setAmarillo(Sem *sem); // prender solamente la luz amarilla
void setRojo(Sem *sem); // prender solamente la luz roja
void liberar_sem(Sem *sem); // liberar un semaforo
void empezarCiclo(Sem *sem1, Sem *sem2, unsigned int velocidad_limite); // empieza el ciclo, nunca termina hasta que el usuario pulse Ctrl + C
void tiempoEspera(unsigned int segundos); // funcion para esperar en el tiempo

/*********************** FUNCIONES MAIN **********************/
void imprimirVia(Sem *sem1, Sem *sem2);
void ayuda();
