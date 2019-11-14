#include <stdlib.h>
#include <stdio.h>

typedef struct semaforo {
	int verde;
	int amarillo;
	int rojo;
}Sem;

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

void ImprimirVia(Sem *sem1, Sem *sem2){
    printf("\n            Semaforo 1      Semaforo 2\n");
    printf("Verde:    \t%d\t\t%d\n", sem1->verde, sem2->verde);
    printf("Amarillo: \t%d\t\t%d\n", sem1->amarillo, sem2->amarillo);
    printf("Rojo:     \t%d\t\t%d\n", sem1->rojo, sem2->rojo);
}

void free_sem(Sem *sem){
    free(sem);
}