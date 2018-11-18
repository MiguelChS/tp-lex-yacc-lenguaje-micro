//
// Created by Mazzziu on 15/11/2018.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "funciones.h"

void inicializarLista(id lista[])
{

    for (int i = 0; i < 10; ++i)
    {
        lista[i].nombre = "vacio";
        lista[i].valor = 0;
    }
}

void mostrarLista(id lista[10])
{

    printf(".:VARIABLES:.\n");

    for (int i = 0; i < 10; ++i)
    {
        printf("%s = %d \n", lista[i].nombre, lista[i].valor);
    }
}

void agregar(char *name, int valor, id lista[], int *posicion){

    int pos = *posicion;

    int verificacion;

    verificacion = verificaVariable(&name,lista,pos); // aca no se porque no agarra bien el resultado

    printf("verificacion: %d", verificacion);

    if (verificacion == 11){
        printf("Agregada en pos: %d", *posicion);
        lista[*posicion].nombre = name;
        lista[*posicion].valor = valor;

        pos ++;
        *posicion = pos;

    }else{
        printf("Pisada en pos: %d", verificacion);
        lista[verificacion].nombre = name;
        lista[verificacion].valor = valor;
    }


}


int verificaVariable(char *name,id lista[], int pos){


    for (int i = 0; i <= pos; ++i)
    {
        if(lista[i].nombre == name){
            return (i); // devuelve la posicion que encontro igual
        }else{
            continue;
        }
    }
    return 11; // le puse 11 porque esa posicion nunca esta en nuestro vector
}