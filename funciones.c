//
// Created by Mazzziu on 15/11/2018.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "funciones.h"



void inicializarLista(id lista[]) {

    for (int i = 0; i < 10; ++i)
    {
        lista[i].nombre = "vacio";
        lista[i].valor = 0;
    }
}

void mostrarLista(id lista[10]) {

    printf(".:VARIABLES:.\n");

    for (int i = 0; i < 10; ++i)
    {
        printf("%s = %d \n", lista[i].nombre, lista[i].valor);
    }
}

void agregar(char *name, int valor, id lista[], int *posicion){

    int pos = *posicion;

    int verificacion;

    verificacion = verificaVariable(name,lista,pos);

    //printf("verificacion: %d\t", verificacion);

    if (verificacion == 11){
        //printf("Agregada en pos: %d\n", *posicion);
        lista[*posicion].nombre = name;
        lista[*posicion].valor = valor;

        ++pos;
        *posicion = pos;

    }else{
        //printf("Pisada en pos: %d\n", verificacion);
        lista[verificacion].nombre = name;
        lista[verificacion].valor = valor;
    }
}

int verificaVariable(char *name,id lista[10], int pos){

    for (int i = 0; i < pos; ++i) {

        if(strcmp(lista[i].nombre , name) == 0) {
            return (i);
        }
    }
    return 11; // le puse 11 porque esa posicion nunca esta en nuestro vector
}

void cargarVatriable(list_char * listaVariablesLeer,id lista[], int * pos){
    list_char * aux = listaVariablesLeer;
    int valor = 0;
    while(aux){
        printf("Ingrese %s: ", aux->valor);
        scanf("%d", &valor);
        agregar(aux->valor,valor,lista,pos);
        aux = aux->sigValor;
    }
}

list_char * list_char_push(char * name, list_char * lista){
    list_char * newNodo = malloc(sizeof(list_char));
    newNodo->valor = name;
    newNodo->sigValor = lista;
    return newNodo;
}

list_int * list_int_push(int valor, list_int * lista) {
    list_int * newNodo = malloc(sizeof(list_int));
    newNodo->valor = valor;
    newNodo->sigValor = lista;
    return newNodo;
}

void showListResult(list_int * lista){
    list_int * aux = lista;
    while(aux){
        printf("%d\n", aux->valor);
        aux = aux->sigValor;
    }
}

int retornarValor(char *name, id lista[10]){

    int pos = verificaVariable(name,lista,10);

    if(pos == 11){
        printf("Error Variable no definida (%s)\n",name);
        exit(0);
    }

    int valor = lista[pos].valor;

    return valor;
}