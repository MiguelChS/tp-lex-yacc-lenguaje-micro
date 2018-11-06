%{
    #include "codigo.h"
    #include <stdio.h>
%}
%option noyywrap

espacio     [ \t]+
digito      [0-9]
numero      {digito}+
letra       [A-Za-z]
identificador       {letra}+{numero}


%%

{espacio}                       { /* no hace nada */}
"exit"| "quit" | "fin"          { printf("\n Ejecucion Finalizada"); exit(0);}
{numero}                        {
                                    yylval.valor = atoi(yytext);
                                    return (NUMERO);
                                }

{identificador}                 { if (strlen(yytext) > 32) {
                                        printf("\n Error de lexico, identificador > 32"); exit(0);
                                        }else{
                                        return (IDENTIFICADOR);
                                        }
                                }


"inicio"                        return (INICIO);
"fin"                           return (FIN);
"leer"                          return (LEER);
"escribir"                      return (ESCRIBIR);
":="                            return (ASIGNACION);
"+"                             return(MAS);
"-"                             return (RESTA);
","                             return(COMA);
";"                             return (PUNTOYCOMA);
"("                             return(PAR_IZ);
")"                             return(PAR_DER);

%%