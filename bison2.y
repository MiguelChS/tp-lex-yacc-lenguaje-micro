%{

    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "funciones.h"

    extern FILE *yyin;
    
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
%token              MAS MENOS

%left MAS MENOS

%type <valor> operacion
%type <valor> variable

%start programa


%%

programa: INICIO linea FIN PUNTO        {printf("ok \n");mostrarLista(lista); exit(0);}

linea: sentencia                        {}
    | linea sentencia                   {}

sentencia : asignacion
    | leer

asignacion: IDENTIFICADOR ASIGNACION NUMERO PUNTOYCOMA { agregar($1,$3, lista, &posicionAgregada); }
    | IDENTIFICADOR ASIGNACION operacion PUNTOYCOMA { agregar($1,$3, lista, &posicionAgregada); }

leer:LEER PARA listaleer PARC PUNTOYCOMA { cargarVatriable(listaVaribles, lista, &posicionAgregada); }

listaleer: IDENTIFICADOR  { listaVaribles = list_char_push($1,listaVaribles); }
    | IDENTIFICADOR COMA listaleer { listaVaribles = list_char_push($1,listaVaribles); }


operacion: variable     {$$ = $1;}
    | NUMERO        {$$ = $1;}
    | variable MAS operacion {$$ = $1 + $3;}
    | NUMERO MAS operacion  {$$ = $1 + $3;}
    | variable MENOS operacion  {$$ = $1 - $3;}
    | NUMERO MENOS operacion    {$$ = $1 - $3;}

variable: IDENTIFICADOR  { $$ = retornarValor($1,lista); }

%%
int yyerror(char *s){
printf("no se reconoce %s \n", s);
}

int main (int argc, char *argv []){

    inicializarLista(lista);

    if (argc == 2)
    {
    	FILE *source = fopen(argv[1], "r");
    	
    	if (!source) {
    		printf("Imposible abrir el archivo %s.\n", argv[1]);
    		return -1;
    	}
    	
    	yyin = source;
    }

    yyparse();

}
