%{
  #include <stdio.h>

  #ifdef DEBUG
    #define DEBUG_YACC(list...) \
      printf(list);
  #else
    #define DEBUG_YACC(list...)
  #endif


  #define TRAITER_INSTRUCTION(A, B, C, D) \
    {                                     \
      printf("\"");                       \
      print_binaire(A, 8);                \
      printf("\" & \"");                 \
      print_binaire(B, 8);                \
      printf("\" & \"");                 \
      print_binaire(C, 8);                \
      printf("\" & \"");                 \
      print_binaire(D, 8);                \
      printf("\",\n ");                   \
    } while (0);

  void print_binaire(int nombre, int taille) {
    int mask = 1 << (taille - 1);
    while (mask) {
      if ((nombre & mask) == 0) {
        printf("0");
      } else {
        printf("1");
      }
      mask = mask >> 1;
    }
  }

  #define DEST_ADD   0x1
  #define DEST_MUL   0x2
  #define DEST_SOU   0x3
  #define DEST_DIV   0x4
  #define DEST_COP   0x5
  #define DEST_AFC   0x6
  #define DEST_LOAD   0x7
  #define DEST_STORE   0x8
  #define DEST_EQU   0x9
  #define DEST_INF   0xA
  #define DEST_INFE   0xB
  #define DEST_SUP   0xC
  #define DEST_SUPE  0xD
  #define DEST_JMP 0xE
  #define DEST_JMPC 0xF

%}

%token tADD tMUL tSOU tDIV tCOP tAFC tJMP tJMPC tINF tSUP tEQU tLOAD tSTORE tINFE tSUPE tENT

%%

instructions : instruction instructions |
               ;

instruction : instruction_add |
              instruction_mul |
              instruction_sou |
              instruction_div |
              instruction_cop |
              instruction_afc |
              instruction_jmp |
              instruction_jmpc |
              instruction_inf |
              instruction_sup |
              instruction_equ |
              instruction_infe |
              instruction_supe |
              instruction_load |
              instruction_store
              ;

instruction_add : tADD tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_ADD,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_mul : tMUL tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_MUL,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_sou : tSOU tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_SOU,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_div : tDIV tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_DIV,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_cop : tCOP tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 1, 0);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_afc : tAFC tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_AFC,   $2, $3, 0);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_jmp : tJMP tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_JMP, $2, 0, 0);
                  };

instruction_jmpc : tJMPC tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_JMPC,   $3, 1, 0);
                  };

instruction_inf : tINF tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_INF,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_infe : tINFE tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_INFE,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_sup : tSUP tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_SUP,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_supe : tSUPE tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_SUPE,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_equ : tEQU tENT tENT tENT {
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                    TRAITER_INSTRUCTION(DEST_LOAD,  $3, 2, 0);
                    TRAITER_INSTRUCTION(DEST_EQU,    2, 1, 1);
                    TRAITER_INSTRUCTION(DEST_STORE, $2, $3, 0);
                  };

instruction_load : tLOAD tENT tENT tENT{
                    TRAITER_INSTRUCTION(DEST_LOAD,  $2, 1, 0);
                  };

instruction_store : tSTORE tENT tENT tENT{
                    TRAITER_INSTRUCTION(DEST_STORE,  $2, $3, 0);
                  };

%%
/*
void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}*/

int main(int argc, char **argv) {
  int ret;
  printf("(");
  ret = yyparse();
  printf("others => (others => '0'));\n");
  return ret;
}
