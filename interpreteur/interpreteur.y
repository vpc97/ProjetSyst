%{

  #include <stdio.h>
  #include <stdlib.h>
  #include "table_instructions.h"

  #define YYDEBUG 0

	int yylex(void);

	void yyerror(char*);

	char* type;

%}

%union { char* str; int nb;}

%token tINT tADD tMUL tSOU tDIV tCOP tAFC tLOAD tSTORE tEQU tINF tINFE tSUP tSUPE tJMP tJMPC

%type <nb> tINT

%%
Start : instructions;

instructions : 	instruction instructions |
				instruction
				|
;

instruction :	tADD tINT tINT tINT
						{
							ajouter_instruction("ADD", $2, $3, $4); 
						}
					| tMUL tINT tINT tINT
						{
							ajouter_instruction("MUL", $2, $3, $4);
						}
					| tSOU tINT tINT tINT
						{
							ajouter_instruction("SOU", $2, $3, $4);
						}
					| tDIV tINT tINT tINT
						{
							ajouter_instruction("DIV", $2, $3, $4);
						}
					| tCOP tINT tINT tINT
						{
							ajouter_instruction("COP", $2, $3, $4);
						}
					| tAFC tINT tINT tINT
						{
							ajouter_instruction("AFC", $2, $3, $4);
						}
					| tLOAD tINT tINT tINT
						{
							ajouter_instruction("LOAD", $2, $3, $4);
						}
					| tSTORE tINT tINT tINT
						{
							ajouter_instruction("STORE", $2, $3, $4);
						}
					| tEQU tINT tINT tINT
						{
							ajouter_instruction("EQ", $2, $3, $4);
						}
					| tINF tINT tINT tINT
						{
							ajouter_instruction("INF", $2, $3, $4);
						}
					| tINFE tINT tINT tINT
						{
							ajouter_instruction("INFE", $2, $3, $4);
						}
					| tSUP tINT tINT tINT
						{
							ajouter_instruction("SUP", $2, $3, $4);
						}
					| tSUPE tINT tINT tINT
						{
							ajouter_instruction("SUPE", $2, $3, $4);
						}
					| tJMP tINT tINT tINT
						{
							ajouter_instruction("JMP", $2, $3, $4);
						}
					| tJMPC tINT tINT tINT
						{
							ajouter_instruction("JMPC", $2, $3, $4);
						}

						
						
%%

int main(){

	#if YYDEBUG
		yydebug = 1;
	#endif	

	yyparse();
	interpreter();
	//tester_add();

}
