#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct id {
    char nombre [33];
    int valor;
};

void listaVariables (char * , int, struct id[10]);
int yyerror  (int);


int main(int argc, char *argv[]) {

    struct id listadevariables [10];

   // yyparse();

    return 0;
}

void listaVariables (char nombre[33], int valor, struct id variable [10]){


    for (int i = 0; i <= 10 ; ++i) {
        if (strcmp(variable[i].nombre, nombre) != 0){



        }else{
            yyerror(1);
        }
    }
}



int yyerror (int e){

    switch (e){
        case 1:
            printf("Error variable repetida");

        break;
    }

    return 0;
}