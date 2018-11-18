#!/bin/bash

mkdir .temp

cp ./bison2.y ./.temp/bison2.y
cp ./lex2.l ./.temp/lex2.l
cp ./funciones.c ./.temp/funciones.c
cp ./funciones.h ./.temp/funciones.h

cd ./.temp

bison -d bison2.y
lex lex2.l

gcc bison2.tab.c bison2.tab.h lex.yy.c funciones.h funciones.c

cp ./a.out ../a.out

cd ..

rm -rf ./.temp
