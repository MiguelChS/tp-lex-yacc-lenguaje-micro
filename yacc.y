%{
    #include "codigo.h"
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>

%}
%union{
    int num;
    char [33] letras;
}
%
%token <num>        NUMERO
%token <char>       IDENTIFICADOR
%token              MAS MENOS
%token              ASIGNACION
%token              PARA PARC COMA PUNTOYCOMA
%token              INICIO LEER ESCRIBIR FIN

%left MAS MENOS
%right ASIGNACION

%start programa
type <num> operacion

%%

programa: INICIO lineas FIN
        ;

lineas: sentencia
        | linea sentencia
        ;

sentencia: leer
        | escribir
        | variable
        ;

leer: LEER PARA lista PARC PUNTOYCOMA                       { leer(listadevariables[10])}
        | LEER PARA variable
        ;

escribir: ESCRIBIR PARA lista PARC PUNTOYCOMA               { escribir (listadevariables[10])}
        ;

variable : IDENTIFICADOR                                    { listaVariables($1,0,listadevariables[10]); }

asignar : variable ASIGNACION operacion                     { listaVariables($1,$3,listadevariables[10]); }

lista:  IDENTIFICADOR COMA IDENTIFICADOR
        | operacion
        | variable COMA lista
        | operacion COMA lista
        ;


operacion: NUMERO                                           { $$ = $1;}
        | IDENTIFICADOR                                     { $$ = valordevariable($1);}
        | PARA operacion PARC                               { $$ = $2;}
        | operacion MAS operacion                           { $$ = $1 + $2;}
        | operacion MENOS operacion                         { $$ = $1 - $2;}
        ;


signo: MAS
        | MENOS
        ;

%%

int main (int argc, char *argv []){

 yylval();


}