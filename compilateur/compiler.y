%{#include <stdio.h>
  #include <stdlib.h>
  #include "table_symboles.h"
  #include "mem_instr.h"
  #define YYDEBUG 0
	int yylex(void);
	void yyerror(char*);
	char* type;
%}

%union { char* str; int nb;}

%token tID tPO tPF tAO tAF tMAIN tCONST tSTRING tINT tVAR tIF tWHILE tFOR tELSE tRETURN tDO tPRINTF tSCANF tMULT tSOUSTRACTION tADDITION tDIV tGUILLEMET tCROCHETGAUCHE tCROCHETDROIT tPOINTVIRGULE tVIRGULE tEGAL tDEGAL tDIF tPOINTEXCLAMATION tPOINTINTERROGATION tINF tSUP tINFEGAL tSUPEGAL tPLUSPLUS tMOINSMOINS

%left tDEGAL tDIF
%left tINF tINFEGAL tSUPEGAL tSUP
%left tADDITION tSOUSTRACTION
%left tMULT tDIV

%type <str> tVAR tID dec boolean
%type <nb> tINT tIF tELSE tWHILE if_action else_action

%nonassoc tIFX
%nonassoc tELSE

%%

Start : tVAR tMAIN tPO tPF tAO Body tAF { printf ("main");}
		;
Body : 	declarations instructions 
		| declarations
		| instructions	
		|	
		;
declarations :	declaration declarations 
				| declaration
				;
declaration : 	decl_type tID tPOINTVIRGULE { inserer($2,type); }
				| decl_type tID tVIRGULE dec { inserer($2,type);}
				| decl_type tID tEGAL Exp tPOINTVIRGULE { inserer($2,type); }
				;
decl_type:
	tVAR
	{
		type = $1;
	}
	;

dec : 	tID tPOINTVIRGULE { inserer($1,type); }
		| tID tVIRGULE dec { inserer($1,type); }
		;

instructions :	instruction instructions
				| instruction
				;
instruction : tID tEGAL Exp tPOINTVIRGULE
			{ 
				add_mem_instr("LOAD" , 0 , getLast(), 0);
				supprimer(); 
				add_mem_instr("STORE", getAdresse($1), 0, 0);
			}
			| tPRINTF tPO tID tPF tPOINTVIRGULE 	
			{
			add_mem_instr("PRI", getAdresse($3), 0, 0);
			}
			| tIF tPO boolean tPF if_action tAO Body tAF %prec tIFX
			{
			int pos = $5;
			change(pos, calcul_longueur() - 1);
			}
			
			| tIF tPO boolean tPF if_action tAO Body tAF tELSE else_action tAO Body tAF
			{
			int pos = $9 ;
			change(pos, calcul_longueur() - 1);
			
			}
			| tWHILE tPO boolean tPF tAO Body tAF 
			{
			printf("while\n");
			}
			| tFOR tPO tID tEGAL tINT tPOINTVIRGULE boolean tPOINTVIRGULE tID tPLUSPLUS tPF tAO Body tAF 
			{
			printf("for\n");
			}
			| tFOR tPO tID tEGAL tINT tPOINTVIRGULE boolean tPOINTVIRGULE tID tMOINSMOINS tPF tAO Body tAF 
			{
			printf("for\n");	
			};

if_action : {
			add_mem_instr("LOAD", 1 , getLast(),0);
			add_mem_instr("JMPC", -1, 1, 0);
			$$ = calcul_longueur() - 1;		
			};

else_action: {
			add_mem_instr("JMP", -1, 1, 0);
			$$ = calcul_longueur() - 1;	
			};

boolean :	/*boolean tEGAL boolean 
			{ 
				add_mem_instr("LOAD", 0, getLast(), 0);
				supprimer(); 
				add_mem_instr("STORE", getAdresse($1), 0, 0);
				supprimer();
			}			
			|*/ boolean tDEGAL boolean 
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("EQ", 0, 0, 1);
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}
			| boolean tDIF boolean 
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("EQ", 0, 0, 1);
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}
			/*| boolean tEGAL Exp
			{ 
				add_mem_instr("LOAD", 0, getLast(), 0);
				supprimer(); 
				add_mem_instr("STORE", getAdresse($1), 0, 0);
				supprimer();
			}	
			| boolean tDEGAL Exp
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("EQ", 0, 0, 1);
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}
			| boolean tDIF Exp
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("EQ", 0, 0, 1);
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}*/
			| boolean tINF boolean 
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("INF", 0, 0, 1);
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}
			| boolean tSUP boolean 
			{
			add_mem_instr("LOAD",0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("SUP", 0, 0, 1);
			add_mem_instr("STORE", getLast(), 0,0);
			supprimer();
			}
			| boolean tINFEGAL boolean
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("INFE", 0 , 0 , 1);
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}
			| boolean tSUPEGAL boolean 
			{
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1 ,getLast(), 0);
			add_mem_instr("SUPE ", 0 , 0, 1 );
			add_mem_instr("STORE", getLast(), 0, 0);
			supprimer();
			}
			| tINT
			{ 
				inserer_tmp(" ","int");
				add_mem_instr("AFC", 0, $1, 0); 
				add_mem_instr("STORE", getLast(), 0, 0);
			} 
			| tID
			{ 
				inserer_tmp(" ","int");
				add_mem_instr("LOAD", 0, getAdresse($1), 0); 
				add_mem_instr("STORE", getLast(), 0, 0);
			} 
			;

Exp: 	Exp tADDITION Exp 
		{ 
			add_mem_instr("LOAD", 0, getLast(), 0 );
			supprimer();
			add_mem_instr("LOAD", 1 ,getLast(), 0);
			add_mem_instr("ADD" , 0 , 0 , 1);
			add_mem_instr("STORE", getLast(), 0 , 0);
		}
		| Exp tSOUSTRACTION Exp
		{ 
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("SUB", 0, 1, 0);  
			add_mem_instr("STORE", getLast(), 0, 0);
		}
		| Exp tDIV Exp
		{ 
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("DIV", 0, 0, 1);  
			add_mem_instr("STORE", getLast(), 0, 0);
		}
		| Exp tMULT Exp
		{ 
			add_mem_instr("LOAD", 0, getLast(), 0);
			supprimer();
			add_mem_instr("LOAD", 1, getLast(), 0);
			add_mem_instr("MUL", 0, 1, 0);  
			add_mem_instr("STORE", getLast(), 0, 0);
		}
		| tINT
		{ 
			inserer_tmp("","int");
			add_mem_instr("AFC", 0, $1, 0); 
			add_mem_instr("STORE", getLast(), 0, 0);
		} 
		| tID
		{ 
			inserer_tmp("","int");
			add_mem_instr("LOAD", 0, getAdresse($1), 0); 
			add_mem_instr("STORE", getLast(), 0, 0);
		} 
		| tPO Exp tPF
		;
 
%%

int main(){
	#if YYDEBUG
		yydebug = 1;
	#endif	
	yyparse();
	ecrire_fichier();
}
