//
// Created by Mazzziu on 15/11/2018.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "funciones.h"


void agregar (char *name, int valor){

    //printf( "agregado %s = %d ",name ,valor);

}


void cargar( char *name, int valor, id lista[10]){

    printf( "recibio %s = %d ",name ,valor);

    strcmp(lista[0].nombre, name);
    lista[0].valor = valor;

   // printf( "agregado %s = %d ",lista[0].nombre ,lista[0].valor);
}