#ifndef _TABLE_SYMBOLES_H
#define _TABLE_SYMBOLES_H

typedef struct Variable{
	char * id;
	char * type;
	int depth;
	int tmp;
	struct Variable *suivant;
} Variable;

Variable* inserer(char * var, char * typevar);

Variable* inserer_tmp(char * var, char * typevar);

Variable* supprimer();

int getAdresse(char * idA);

int getLast();

void afficherTS(Variable *TS);

#endif
