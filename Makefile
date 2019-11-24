DEPS = semaforo.h

semaforo: main.c semaforo.o $(DEPS)
	gcc -o semaforo main.c semaforo.o
	$(MAKE) assemble

semaforo.o: semaforo.c $(DEPS)
	gcc -c semaforo.c

.PHONY: clean assemble
clean:
	rm -f *.o semaforo *~ ./assembly_code/*.s

assemble:
	cd ./assembly_code && gcc -S ../*.c 