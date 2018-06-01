%{
	#include "compiler.tab.h"
%}

%%
main	{ return tMAIN; }
"("	{ return tPO; }
")"	{ return tPF; }
"{"	{ return tAO; }
"}"	{ return tAF; }
[0-9]+	{ 
yylval.nb = atoi(yytext);
return tINT; }
const|int|string|void	{ 
	yylval.str = strdup(yytext);	
	return tVAR; 
}
if	{ return tIF; }
while	{ return tWHILE; }
for	{ return tFOR; }
else	{ return tELSE; }
return	{ return tRETURN; }
do	{ return tDO; }
"printf"	{ return tPRINTF; }
scanf	{ return tSCANF; }
"*"	{ return tMULT; }
"-"	{ return tSOUSTRACTION; }	
"+"	{ return tADDITION; }
"/"	{ return tDIV; }
"["	{ return tCROCHETGAUCHE; }
"]"	{ return tCROCHETDROIT; }
";"	{ return tPOINTVIRGULE; }
","	{ return tVIRGULE; }
"=" { return tEGAL; }
"==" {return tDEGAL; }
"!" { return tPOINTEXCLAMATION; }
"!=" { return tDIF; }
"?" { return tPOINTINTERROGATION; }
" "+	{ }
"<" { return tINF; }
">" { return tSUP; }
"<=" { return tINFEGAL; }
">=" { return tSUPEGAL; }
"++"	{ return tPLUSPLUS; }
"--"	{ return tMOINSMOINS; }
"\"" {return tGUILLEMET;}
\t+	{ }
\n	{ }
[a-zA-Z_]+	{
	yylval.str = strdup(yytext);
	return tID;
}


