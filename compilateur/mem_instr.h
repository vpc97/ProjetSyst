#ifndef _MEM_INSTR_H
#define _MEM_INSTR_H

typedef struct Instr {
	char* id;
	int param[3];
}Instr;

Instr add_mem_instr(char* inst, int num, int reg, int dernier);

int calcul_longueur();

void change(int position, int x);

void afficherTableau ();

void ecrire_fichier();

#endif
