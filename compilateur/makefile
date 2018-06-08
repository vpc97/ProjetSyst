all : compiler
lex.yy.c : compiler.l
	./flex compiler.l
compiler.tab.c : compiler.y
	~/bison/bin/bison -d -v compiler.y
compiler : compiler.tab.c lex.yy.c table_symboles.c mem_instr.c 
	gcc -o compiler lex.yy.c compiler.tab.c table_symboles.c mem_instr.c libfl.a ~/bison/lib/liby.a
test : compiler
	./compiler < test.c
