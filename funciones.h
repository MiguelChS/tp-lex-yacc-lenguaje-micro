//
// Created by Mazzziu on 15/11/2018.
//
typedef struct{
    char *nombre;
    int valor;
}id;



#ifndef UNTITLED_FUNCIONES_H
#define UNTITLED_FUNCIONES_H

void inicializarLista(id lista[10]);
void mostrarLista(id lista[10]);
void agregar (char *name, int valor, id lista[], int *);
int verificaVariable(char *name,id lista[10], int);
void leerVariable (char *name,id lista[10], int *);




#endif //UNTITLED_FUNCIONES_H





