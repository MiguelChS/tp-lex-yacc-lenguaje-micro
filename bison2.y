%{

    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "funciones.h"

    id lista[10];
    int posicionAgregada = 0;

%}

%union {

    char *nombre;
    int valor;

}


%token              INICIO FIN
%token              PUNTOYCOMA
%token              SALTO
%token <nombre>     IDENTIFICADOR
%token <valor>      NUMERO
%token              ASIGNACION


%start programa

%%

programa: INICIO linea FIN SALTO        {printf("ok \n");mostrarLista(lista); exit(0);}

linea: sentencia                        {}
    | linea sentencia                   {}

sentencia : asignacion

asignacion: IDENTIFICADOR ASIGNACION NUMERO PUNTOYCOMA { agregar($1,$3, lista, &posicionAgregada); }

%%
int yyerror(char *s){
printf("no se reconoce %s \n", s);
}

int main (int argc, char *argv []){

    inicializarLista(lista);




    yyparse();

}
