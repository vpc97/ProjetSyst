%{
  #include <stdio.h>

  #include "interpreteur.tab.h"

  #define YYSTYPE int
  extern YYSTYPE yylval;

  #ifdef DEBUG
    #define DEBUG_LEX(list...) \
      do {                     \
        printf(list);          \
      } while (0);
  #else
    #define DEBUG_LEX(list...) \
      do {                     \
      } while (0);
  #endif

  int nombre_lignes = 1;
%}

tNLG "\n"
tESP [\t ]
tADD ^" "*0*1
tMUL ^" "*0*2
tSOU ^" "*0*3
tDIV ^" "*0*4
tCOP ^" "*0*5
tAFC ^" "*0*6
tLOAD ^" "*0*7
tSTORE ^" "*0*8
tEQU ^" "*0*9
tINF ^" "*0*A
tINFE ^" "*0*B
tSUP ^" "*0*C
tSUPE ^" "*0*D
tJMP ^" "*0*E
tJMPC ^" "*0*F
tENT -?[0-9]+
tERR .
tCOMMENT "--".*$

%%

{tESP} { }
{tNLG} { nombre_lignes++; }

{tADD} { DEBUG_LEX("Fonction tADD\n"); return tADD; }
{tMUL} { DEBUG_LEX("Fonction tMUL\n"); return tMUL; }
{tSOU} { DEBUG_LEX("Fonction tSOU\n"); return tSOU; }
{tDIV} { DEBUG_LEX("Fonction tDIV\n"); return tDIV; }
{tCOP} { DEBUG_LEX("Fonction tCOP\n"); return tCOP; }
{tAFC} { DEBUG_LEX("Fonction tAFC\n"); return tAFC; }
{tLOAD} { DEBUG_LEX("Fonction tLOAD\n"); return tLOAD; }
{tSTORE} { DEBUG_LEX("Fonction tSTORE\n"); return tSTORE; }
{tEQU} { DEBUG_LEX("Fonction tEQU\n"); return tEQU; }
{tINF} { DEBUG_LEX("Fonction tINF\n"); return tINF; }
{tINFE} { DEBUG_LEX("Fonction tINFE\n"); return tINFE; }
{tSUP} { DEBUG_LEX("Fonction tSUP\n"); return tSUP; }
{tSUPE} { DEBUG_LEX("Fonction tSUPE\n"); return tSUPE; }
{tJMP} { DEBUG_LEX("Fonction tJMP\n"); return tJMP; }
{tJMPC} { DEBUG_LEX("Fonction tJMPC\n"); return tJMPC; }

{tCOMMENT} { DEBUG_LEX("Comment %s\n", yytext); }

{tENT} { DEBUG_LEX("Entier: %d\n", atoi(yytext));
        yylval = atoi(yytext);
        return tENT;
      }

{tERR} { fprintf(stderr, "Erreur a la ligne %d.\n", nombre_lignes);
        exit(1);
      }

%%

//int main(int argc, char **argv) {
//  yylex();
//  return 0;
//}
