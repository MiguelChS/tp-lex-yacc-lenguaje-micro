%{
    #include "bison2.tab.h"
    #include <stdio.h>
%}
%option noyywrap

digito      [0-9]
numero      {digito}+
letra       [A-Za-z]
identificador       {letra}({letra}|{digito})*

%%
"inicio"                        return (INICIO);
"fin"                           return (FIN);

{numero}                        {
                                    yylval.valor = atoi(yytext);
                                    return (NUMERO);
                                }

{identificador}                 {yylval.nombre = strdup(yytext);

                                    return (IDENTIFICADOR); }


";"                             return (PUNTOYCOMA);
":="                            return (ASIGNACION);
"."                            return (SALTO);

%%