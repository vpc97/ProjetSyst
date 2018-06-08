#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mem_instr.h"

Instr mem[1024];
int i=0;
int longueur = sizeof(mem)/sizeof(Instr);
char num_instr;
/*
Instr Init_tableau(){
	for(i=0; i<1024; i++){
		mem[i]=0;
	}
}*/

Instr add_mem_instr(char* inst, int num, int reg, int dernier){
	i = 0;
	int continuer = 1;
	while ((continuer==1) && (i<(sizeof(mem)/sizeof(Instr)))){
		//printf("heehq %d", sizeof(mem)/sizeof(Instr));
			if (mem[i].id == NULL) {
				//printf("ici");
				mem[i].id = inst;
				mem[i].param[0] = num;
				mem[i].param[1] = reg;
				mem[i].param[2] = dernier;
				continuer = 0;
				
			}
		i++;
	} 
}

int calcul_longueur(){
	for (i=0;i<(sizeof(mem)/sizeof(Instr));i++){
			if (mem[i].id == NULL) {
				return i;	
			}
	} 
}

void change(int position, int x){
	mem[position].param[0] = x;
}


void afficherTableau (){
	for(i=0; i<(sizeof(mem)/sizeof(Instr)); i++){
		printf("Instruction : %s Numero : %d Registre : %d, dernier: %d\n",  mem[i].id, mem[i].param[0], mem[i].param[1], mem[i].param[2]);
	}
}

void ecrire_fichier(){
	FILE *f = fopen("assembleur.txt", "w");
	if (f == NULL)
	{
		printf("Error opening file!\n");
		exit(1);
	}

	for(i=0; i<(sizeof(mem)/sizeof(Instr)); i++){
		if (mem[i].id != NULL){
			if (strcmp(mem[i].id, "ADD") == 0) {
				num_instr = '1';
			} else if (strcmp(mem[i].id, "MUL") == 0) {
				num_instr = '2';
			} else if (strcmp(mem[i].id, "SOU") == 0) {
				num_instr = '3';
			} else if (strcmp(mem[i].id, "DIV") == 0) {
				num_instr = '4';
			} else if (strcmp(mem[i].id, "COP") == 0) {
				num_instr = '5';
			} else if (strcmp(mem[i].id, "AFC") == 0) {
				num_instr = '6';
			} else if (strcmp(mem[i].id, "LOAD") == 0) {
				num_instr = '7';
			} else if (strcmp(mem[i].id, "STORE") == 0) {
				num_instr = '8';
			} else if (strcmp(mem[i].id, "EQU") == 0) {
				num_instr = '9';
			} else if (strcmp(mem[i].id, "INF") == 0) {
				num_instr = 'A';
			} else if (strcmp(mem[i].id, "INFE") == 0) {
				num_instr = 'B';
			} else if (strcmp(mem[i].id, "SUP") == 0) {
				num_instr = 'C';
			} else if (strcmp(mem[i].id, "SUPE") == 0) {
				num_instr = 'D';
			} else if (strcmp(mem[i].id, "JMP") == 0) {
				num_instr = 'E';
			} else if (strcmp(mem[i].id, "JMPC") == 0) {
				num_instr = 'F';
			}

			fprintf(f, "%c %d %d %d\n",  num_instr, mem[i].param[0], mem[i].param[1], mem[i].param[2]);

			//fprintf(f, "%s %d %d %d\n",  mem[i].id, mem[i].param[0], mem[i].param[1], mem[i].param[2]);
		}
	}

	fclose(f);

}
/*
void main(){
	printf("Tableau initial : \n");
	afficherTableau();
	add_mem_instr("ADD", 1, 0);
	add_mem_instr("JMP", 3, 1);
	afficherTableau();
}*/
