%{

    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "funciones.h"

    id lista[10];

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

programa: INICIO linea FIN SALTO        {printf("ok \n"); exit(0);}

linea: sentencia                        {printf("ok1 \n");}
    | linea sentencia                   {printf("ok2 \n");}

sentencia : asignacion

asignacion: IDENTIFICADOR ASIGNACION NUMERO PUNTOYCOMA {agregar($1,$3);

                                                       }


%%
int yyerror(char *s){
printf("no se reconoce %s \n", s);
}

int main (int argc, char *argv []){

    inicializarLista(&lista[10]);

    mostrarLista(&lista[10]);


    yyparse();

}
