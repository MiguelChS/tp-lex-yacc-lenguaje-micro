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

    printf("pos: %d", *posicion);
    lista[*posicion].nombre = name;
    lista[*posicion].valor = valor;
    pos ++;
    *posicion= pos;
}
