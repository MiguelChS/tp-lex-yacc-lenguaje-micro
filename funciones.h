//
// Created by Mazzziu on 15/11/2018.
//
typedef struct{
    char *nombre;
    int valor;
}id;

typedef struct{
    char * valor;
    void * sigValor;
}list_char;

typedef struct {
    int valor;
    void * sigValor;
}list_int;



#ifndef UNTITLED_FUNCIONES_H
#define UNTITLED_FUNCIONES_H

list_char * list_char_push(char * name, list_char * lista);
list_int * list_int_push(int valor, list_int * lista);
void showListResult(list_int * lista);
void inicializarLista(id lista[10]);
void mostrarLista(id lista[10]);
void agregar (char *name, int valor, id lista[], int *);
int verificaVariable(char *name,id lista[10], int);
void leerVariable (char *name,id lista[10], int *);
int retornarValor(char *name, id lista[10]);




#endif //UNTITLED_FUNCIONES_H





