%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "y.tab.h"
	int yyerror(char *errormsg);
	int yyparse();
	int yylineno;
	char *yytext;
%}

%%

[ \t\n]             /* ignore whitespace */
"true"					return TRUE;
"false"					return FALSE;
"danif"					return DANIF;
"entonces"				return ENTONCES;
"manuelse"				return MANUELSE;
"camilor"				return CAMILOR;
"hacejoan"				return HACEJOAN;
"mientrasjoan"			return MIENTRASJOAN;
"<"						return '<';
">"						return '>';
"=="         			return EQ;
"+"						return '+';
"-"						return '-';
"*"						return '*';
"/"						return '/';
"="						return '=';
"("						return '(';
")"						return ')';
[0-9]+					{ yylval.intval = atoi(yytext); return ISANT; }
[a-zA-Z][a-zA-Z0-9]*	{ yylval.strval = strdup(yytext); return ISAFICADOR; }
.                   	return yytext[0];

%%

int yywrap() {
    return 1;
}
