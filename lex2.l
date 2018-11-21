%{
    #include "bison2.tab.h"
    #include <stdio.h>
%}
%option noyywrap

espacio     [ \t]+
digito      [0-9]
numero      {digito}+
letra       [A-Za-z]
identificador       {letra}({letra}|{digito})*

%%
"espacio"                       { /* se ignoran */}
"inicio"                        return (INICIO);
"fin"                           return (FIN);
"leer"                          return (LEER);
"escribir"                      return (ESCRIBIR);

{numero}                        {
                                    yylval.valor = atoi(yytext);
                                    return (NUMERO);
                                }



{identificador}                 {yylval.nombre = strdup(yytext);

                                    return (IDENTIFICADOR); }


";"                             return (PUNTOYCOMA);
":="                            return (ASIGNACION);
"."                             return (PUNTO);
","                             return (COMA);
"("                             return (PARA);
")"                             return (PARC);
"+"                             return (MAS);
"-"                             return (MENOS);

%%