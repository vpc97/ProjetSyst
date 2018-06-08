all : interpreteur
lex.yy.c : interpreteur.l
	./flex interpreteur.l
interpreteur.tab.c : interpreteur.y
	~/bison/bin/bison -d -v interpreteur.y
interpreteur : interpreteur.tab.c lex.yy.c
	gcc -o interpreteur lex.yy.c interpreteur.tab.c libfl.a ~/bison/lib/liby.a
test : interpreteur
	./interpreteur < test.c
