%{

    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <unistd.h>
    #include "funciones.h"

    extern FILE *yyin;
    
    id lista[10];
    int posicionAgregada = 0;
    list_char * listaVaribles = NULL;
    list_char * listResult = NULL;

%}

%union {

    char *nombre;
    int valor;

}


%token              INICIO FIN
%token              LEER ESCRIBIR
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
%type <valor> listaescribir

%start programa


%%



programa: INICIO linea FIN PUNTO        {printf("FIN \n"); exit(0);}

linea: sentencia
    | linea sentencia

sentencia : asignacion
    | leer
    | escribir

asignacion: IDENTIFICADOR ASIGNACION NUMERO PUNTOYCOMA { agregar($1,$3, lista, &posicionAgregada); }
    | IDENTIFICADOR ASIGNACION operacion PUNTOYCOMA { agregar($1,$3, lista, &posicionAgregada); }

leer:LEER PARA listaleer PARC PUNTOYCOMA { cargarVatriable(listaVaribles, lista, &posicionAgregada); listaVaribles = NULL; }

listaleer: IDENTIFICADOR  { listaVaribles = list_char_push($1,listaVaribles); }
    | IDENTIFICADOR COMA listaleer { listaVaribles = list_char_push($1,listaVaribles); }

escribir: ESCRIBIR PARA listaescribir PARC PUNTOYCOMA { showListResult(listResult); listResult = NULL; }

listaescribir: variable     { listResult = list_int_push($1,listResult);}
    | operacion     { listResult = list_int_push($1,listResult);}
    | variable COMA listaescribir   { listResult = list_int_push($1,listResult);}
    | operacion COMA listaescribir  { listResult = list_int_push($1,listResult);}

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

    if (argc == 1){
        FILE *archivo = fopen("codigo.txt","w+");
        char buffer[200];
        printf("Escribe tu codigo micro!\n");
        scanf("%s",&buffer);
        while(strcmp(buffer,"analizar") != 0){
            fprintf(archivo,"%s\n",buffer);
            scanf("%s",&buffer);
        }
        fclose(archivo);
        archivo = fopen("./codigo.txt", "r");
    	if (!archivo) {
    		printf("Imposible abrir el archivo codigo.txt.\n");
    		return -1;
    	}
    	yyin = archivo;
    }else{
        printf("leer Archivo \n");
        FILE *source = fopen(argv[1], "r");
    	if (!source) {
    		printf("Imposible abrir el archivo %s.\n", argv[1]);
    		return -1;
    	}
    	yyin = source;
    }

    yyparse();

}
