#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct{
    char nombre [33];
    int valor;
}id;

void listaVariables (char * , int,id[10]);
int yyerror  (int);
id inicializar (id [10]);
id agregarEnLista (id [10], char[33], int);
int verificaVariables (id [10], char [33]);


int main(int argc, char *argv[]) {

    id listadevariables [10];

    inicializar(listadevariables);


   // yyparse();

    return 0;
}

id inicializar (id lista[10]){

    for (int i = 0; i <=10 ; ++i) {
        memset(lista[i].nombre,'\0',33);
    }
    return lista[10];
}


id agregarEnLista (id lista[10], char nombre [33], int valor){

    int cont=0;

    for (int j = 0; j <=10 ; ++j) {
        if (lista[j].nombre != '\0'){
            cont++;
        }
    }

    strcpy(lista[cont].nombre, nombre);

    lista[cont].valor = valor;

    return lista[10];
}

int verificaVariables (id lista[10], char nombre [33]) {

    for (int i = 0; i <= 10; ++i) {
        if (strcmp(lista[i].nombre, nombre) != 0) {
            return 1;
        }
    }

    return 0;
}

void listaVariables (char nombre[33], int valor,id variable [10]){



    for (int i = 0; i <= 10 ; ++i) {

        if (verificaVariables(variable[i],nombre) == 0){

        agregarEnLista(variable,nombre,valor);

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