#ifndef _TABLE_INSTRUCTIONS_H
#define _TABLE_INSTRUCTIONS_H	


typedef struct Instr {
	int indice;
	char* instruction;
	int valeur1;
	int valeur2;
	int valeur3;
}Instr;


Instr ajouter_instruction(char* inst, int val1, int val2, int val3);

void interpreter();

void tester_add();


#endif
