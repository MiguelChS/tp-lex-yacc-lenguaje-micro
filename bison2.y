%{

    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    //#include "funciones.h"

    typedef struct{
        char *nombre;
        int valor;
    }id;

    void cargar( char *name, int valor, id [10]);

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

asignacion: IDENTIFICADOR ASIGNACION NUMERO PUNTOYCOMA {cargar ($1, $3, &lista[10]);

                                                       }


%%
int yyerror(char *s){
printf("no se reconoce %s \n", s);
}

int main (int argc, char *argv []){



    yyparse();

}


void cargar( char *name, int valor, id lista[10]){

    printf( "recibio %s = %d ",name ,valor);

    strcmp(lista[0].nombre, name);
    lista[0].valor = valor;

   // printf( "agregado %s = %d ",lista[0].nombre ,lista[0].valor);
}