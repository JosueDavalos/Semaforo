# Proyecto: Semáforo 
Simulación del funcionamiento de un semaforo de dos vías cuyo ciclo depende de la velocidad máxima permitidad en una carretera determinada.

## Uso
El programa *semaforo* tiene el siguiente uso:
```
$ ./semaforo -h
Semaforo de dos vias. El tiempo de duracion del ciclo depende de la velocidad de la carretera.

Usos:
  semaforo [-v <velocidad>]
  semaforo -h

Opciones:
  -v 		Velocidad en Km/h 
  -h 		Mostrar informacion de ayuda.
```
Ejemplo, para ejecutar el semaforo con valores default (Velocidad 20 KM/h):
```
$ ./semaforo 
Velocidad límite en km/h: 20
Velocidad límite en m/s: 5 (aproximadamente)
Duración total de ciclo en segundos: 40
Tiempo Rojo: 18 segundos
Tiempo Amarillo: 1 segundos
Tiempo Verde: 17 segundos
Empezamos el ciclo:

            Semaforo 1      Semaforo 2
Rojo:     	    1		        0
Amarillo:   	0		        0
Verde:      	0		        1

            Semaforo 1      Semaforo 2
Rojo:     	    1		        0
Amarillo:   	0		        1
Verde:      	0		        0

            Semaforo 1      Semaforo 2
Rojo:       	0		        1
Amarillo: 	    0		        0
Verde:    	    1		        0
```

Ejemplo, para ejecutar el semaforo con un valor de velocidad diferente:
```
$ ./semaforo -v 80
Velocidad límite en km/h: 80
Velocidad límite en m/s: 22 (aproximadamente)
Duración total de ciclo en segundos: 40
Tiempo Rojo: 21 segundos
Tiempo Amarillo: 4 segundos
Tiempo Verde: 17 segundos
Empezamos el ciclo:

            Semaforo 1      Semaforo 2
Rojo:     	    1		        0
Amarillo:   	0		        0
Verde:      	0		        1

            Semaforo 1      Semaforo 2
Rojo:     	    1		        0
Amarillo:   	0		        1
Verde:      	0		        0

            Semaforo 1      Semaforo 2
Rojo:       	0		        1
Amarillo: 	    0		        0
Verde:    	    1		        0

```


## Compilación
Para compilar el repositorio:
```
$ make
```
Para limpiar los archivos generados en la compilación:
```
$ make clean
```

## Integrantes
- Josue Davalos
- Erick Pulla