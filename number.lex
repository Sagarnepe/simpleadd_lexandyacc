%{
#include<stdio.h>
#include<iostream>
using namespace std;
#include<string.h>
#include "./sample.hpp"

extern int line;
extern int stringnum;
%}

%option noyywrap

%%
/t          { }
" "         { }

"MOV"
{
    yylval.string=strdup(yytext);
    stringNumber += yyleng;
	return TOKEN_MOVCMD;
}

"ADD"
{
    yylval.string=strdup(yytext);
    stringNumber += yyleng;
    return TOKEN_ADDCMD;
}

"AL"
{
    yylval.string = strdup(yytext);
    stringnum += yyleng;
    return TOKEN_REG;
}

"Num1"
{
    yylval.string = strdup(yytext);
    stringnum += yyleng;
    return TOKEN_OPHD;
}

"Num2"
{
    yylval.string = strdup(yytext);
    stringnum += yyleng;
    return TOKEN_OPHD;
}

"RESULT"
{
    yylval.string = strdup(yytext);
    stringnum += yyleng;
    return TOKEN_REG;
}

","
{
	yylval.string=strdup(yytext);
    stringNumber += yyleng;
    return TOKEN_COMMA;
}


%%
