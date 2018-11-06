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
        | asignar
        ;


asignar : IDENTIFICADOR ASIGNACION operacion PUNTOYCOMA;        { llama a la funcion para agregar la variable }


leer: LEER PARA listaleer PARC PUNTOYCOMA
        ;


listaleer: IDENTIFICADOR                                    { hay que crear una funcion con algun scanf por cada variable}
        | IDENTIFICADOR COMA listaleer
        ;


escribir: ESCRIBIR PARA listaescribir PARC PUNTOYCOMA
        ;



listaescribir: IDENTIFICADOR                                { $$ = valordevariable($1); //funcion que no arme todavia}
            | operacion                                     { $$ = $1;}
            | IDENTIFICADOR COMA listaeescribir             { todavia no se como seguir aca xD...}
            | operacion COMA listaescribir
            ;


operacion: NUMERO                                           { $$ = $1;}
        | IDENTIFICADOR                                     { $$ = valordevariable($1);}
        | PARA operacion PARC                               { $$ = $2;}
        | operacion MAS operacion                           { $$ = $1 + $2;}
        | operacion MENOS operacion                         { $$ = $1 - $2;}
        ;

%%

int main (int argc, char *argv []){

 yyparse();



}


