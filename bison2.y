%{

    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "funciones.h"
    
    id lista[10];
    int posicionAgregada = 0;
    list_char * listaVaribles = NULL;

%}

%union {

    char *nombre;
    int valor;

}


%token              INICIO FIN
%token              LEER
%token              PUNTOYCOMA
%token              COMA
%token              PUNTO
%token <nombre>     IDENTIFICADOR
%token <valor>      NUMERO
%token              ASIGNACION
%token              PARA PARC

%start programa


%%

programa: INICIO linea FIN PUNTO        {printf("ok \n");mostrarLista(lista); exit(0);}

linea: sentencia                        {}
    | linea sentencia                   {}

sentencia : asignacion
    | leer

asignacion: IDENTIFICADOR ASIGNACION NUMERO PUNTOYCOMA { agregar($1,$3, lista, &posicionAgregada); }

leer:LEER PARA listaleer PARC PUNTOYCOMA { cargarVatriable(listaVaribles, lista, &posicionAgregada); }

listaleer: IDENTIFICADOR  { listaVaribles = list_char_push($1,listaVaribles); }
    | IDENTIFICADOR COMA listaleer { listaVaribles = list_char_push($1,listaVaribles); }


%%
int yyerror(char *s){
printf("no se reconoce %s \n", s);
}

int main (int argc, char *argv []){

    inicializarLista(lista);

    yyparse();

}
