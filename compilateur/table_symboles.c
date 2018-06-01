#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "table_symboles.h"

Variable* TableSymbole = NULL;

Variable* inserer(char * var, char * typevar) {
	printf("%s, %s\n", var, typevar);
	Variable * aux;
	aux = TableSymbole;
	while (aux) {
		if (strcmp(aux->id, var) == 0)
			{return aux;}
		aux = aux -> suivant;
	}
	aux = (Variable*) malloc(sizeof(Variable));
	aux->id = (char*) malloc(strlen(var)+1);
	strcpy(aux->id,var);
	aux->type = (char*) malloc(strlen(typevar)+1);
	strcpy(aux->type,typevar);
	aux->depth = 0;
	aux->tmp = 0;

	aux->suivant = TableSymbole;
	TableSymbole = aux;

	afficherTS(TableSymbole);
	return TableSymbole;
}

Variable* inserer_tmp(char * var, char * typevar) {
	Variable * aux;
	aux = TableSymbole;
	/*while (aux) {
		if (strcmp(aux->id, var) == 0)
		{	return aux;}
		aux = aux -> suivant;
	}*/
	aux = (Variable*) malloc(sizeof(Variable));
	aux->id = (char*) malloc(strlen(var)+1);
	strcpy(aux->id,var);
	aux->type = (char*) malloc(strlen(typevar)+1);
	strcpy(aux->type,typevar);
	aux->depth = 0;
	aux->tmp = 1;

	aux->suivant = TableSymbole;
	TableSymbole = aux;

	return TableSymbole;
}

Variable* supprimer() {
	
 	if(TableSymbole != NULL)
    {
        Variable* aRenvoyer = TableSymbole->suivant;
        free(TableSymbole);
        TableSymbole = aRenvoyer;
    }
	
	afficherTS(TableSymbole);
	return TableSymbole;
}

int getAdresse(char * idA) {
	int index = 0;
	Variable * aux;
	aux = TableSymbole;
	while (aux) {
		if (strcmp(aux->id,idA) == 0)
		{	return index;}
		index++;
		aux = aux->suivant;
	}
}

int getLast() {
	int index = 0;
	Variable * aux;
	aux = TableSymbole;
	while (aux) {
		index++;
		aux = aux->suivant;
	}
	return index;
}

void afficherTS(Variable *TS){
	if (TS == NULL)
    {
        exit(EXIT_FAILURE);
    }

    Variable *aux = TS;

    while (aux != NULL)
    {
        printf("%s -> ", aux->id);
        aux = aux->suivant;
    }
    printf("NULL\n");
}





