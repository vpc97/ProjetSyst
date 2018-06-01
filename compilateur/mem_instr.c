#include <stdio.h>
#include <stdlib.h>
#include "mem_instr.h"

Instr mem[1024];
int i=0;
int longueur = sizeof(mem)/sizeof(Instr);
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
			fprintf(f, "%s %d %d %d\n",  mem[i].id, mem[i].param[0], mem[i].param[1], mem[i].param[2]);
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
