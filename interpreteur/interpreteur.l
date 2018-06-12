%{

	#include "interpreteur.tab.h"

%}



%%

[0-9]+	{ yylval.nb = atoi(yytext);
		  return tINT; }
		  
"ADD"	{ return tADD; }
"MUL"	{ return tMUL; }
"SOU"	{ return tSOU; }
"DIV"	{ return tDIV; }
"COP"	{ return tCOP; }
"AFC"	{ return tAFC; }
"LOAD"	{ return tLOAD; }
"STORE"	{ return tSTORE; }
"EQ"	{ return tEQU; }
"INF"	{ return tINF; }
"INFE"	{ return tINFE; }
"SUP"	{ return tSUP; }
"SUPE"	{ return tSUPE; }
"JMP"	{ return tJMP; }
"JMPC"	{ return tJMPC; }
