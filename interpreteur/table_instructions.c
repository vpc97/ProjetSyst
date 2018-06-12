#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "table_instructions.h"

Instr tableau[1024]; //tableau contenant les instructions assembleur
int registres[16]; //tableau de 16 entiers qui simulera les registres
int memoire[1024]; //tableau d'entiers qui simulera la mémoire
int i=0;
int j=0;

Instr ajouter_instruction(char* inst, int val1, int val2, int val3){

	i = 0;
	int continuer = 1;

	while ((continuer==1) && (i<(sizeof(tableau)/sizeof(Instr)))){
			
			if (tableau[i].instruction == NULL) {
				
				tableau[i].indice = i;
				tableau[i].instruction = inst;
				tableau[i].valeur1 = val1;
				tableau[i].valeur2 = val2;
				tableau[i].valeur3 = val3;

				continuer = 0;
			}

		i++;

	} 

}


void interpreter() {
	/*registres[0] = 5;
	registres[1] = 12; // pour le test*/
	
	for (i=0 ; i<(sizeof(tableau)/sizeof(Instr)) ; i++) {
		if (tableau[i].instruction != NULL){	
			if (strcmp(tableau[i].instruction, "ADD") == 0) {
				//printf("Instruction ADD : %d = %d + %d ", registres[tableau[i].valeur1], registres[tableau[i].valeur2], registres[tableau[i].valeur3]); 
				registres[tableau[i].valeur1] = registres[tableau[i].valeur2] + registres[tableau[i].valeur3];       
		    } else if (strcmp(tableau[i].instruction, "MUL") == 0) {
				registres[tableau[i].valeur1] = registres[tableau[i].valeur2] * registres[tableau[i].valeur3]; 
			} else if (strcmp(tableau[i].instruction, "SOU") == 0) {
				registres[tableau[i].valeur1] = registres[tableau[i].valeur2] - registres[tableau[i].valeur3]; 
			} else if (strcmp(tableau[i].instruction, "DIV") == 0) {
				registres[tableau[i].valeur1] = registres[tableau[i].valeur2] / registres[tableau[i].valeur3]; 
			} else if (strcmp(tableau[i].instruction, "COP") == 0) {
				registres[tableau[i].valeur1] = registres[tableau[i].valeur2];
			} else if (strcmp(tableau[i].instruction, "AFC") == 0) {
				//printf("Instruction AFC : R%d = %d ", tableau[i].valeur1, tableau[i].valeur2); 
				registres[tableau[i].valeur1] = tableau[i].valeur2; 
				
			} else if (strcmp(tableau[i].instruction, "LOAD") == 0) {
				//printf("Instruction LOAD : R%d = %d ", tableau[i].valeur1, memoire[tableau[i].valeur2]); 
				registres[tableau[i].valeur1] = memoire[tableau[i].valeur2];
			} else if (strcmp(tableau[i].instruction, "STORE") == 0) {
				//printf("Instruction STORE : @%d = %d ", tableau[i].valeur1, registres[tableau[i].valeur2]); 
				memoire[tableau[i].valeur1] = registres[tableau[i].valeur2];
			} else if (strcmp(tableau[i].instruction, "EQ") == 0) {
				if ( registres[tableau[i].valeur2] == registres[tableau[i].valeur3] ) {
					registres[tableau[i].valeur1] = 1;
				} else {
					registres[tableau[i].valeur1] = 0;
				}
			} else if (strcmp(tableau[i].instruction, "INF") == 0) {
				if ( registres[tableau[i].valeur2] < registres[tableau[i].valeur3] ) {
					registres[tableau[i].valeur1] = 1;
				} else {
					registres[tableau[i].valeur1] = 0;
				}
			} else if (strcmp(tableau[i].instruction, "INFE") == 0) {
				if ( registres[tableau[i].valeur2] <= registres[tableau[i].valeur3] ) {
					registres[tableau[i].valeur1] = 1;
				} else {
					registres[tableau[i].valeur1] = 0;
				}
			} else if (strcmp(tableau[i].instruction, "SUP") == 0) {
				if ( registres[tableau[i].valeur2] > registres[tableau[i].valeur3] ) {
					registres[tableau[i].valeur1] = 1;
				} else {
					registres[tableau[i].valeur1] = 0;
				}
			} else if (strcmp(tableau[i].instruction, "SUPE") == 0) {
				if ( registres[tableau[i].valeur2] >= registres[tableau[i].valeur3] ) {
					registres[tableau[i].valeur1] = 1;
				} else {
					registres[tableau[i].valeur1] = 0;
				}
			} else if (strcmp(tableau[i].instruction, "JMP") == 0) {
				i = registres[tableau[i].valeur1];
			} else if (strcmp(tableau[i].instruction, "JMPC") == 0) {
				if ( registres[tableau[i].valeur3] == 0 ) {
					i = registres[tableau[i].valeur1];	
				}
			}
		}
	}
}
	
void tester_add(){
	//on teste le add par exemple r0 = r0 + r1 = 5 + 12
	
	for (j=0 ; j<16 ; j++ ) {
		printf("%d ",registres[j]);

	}
}
	












