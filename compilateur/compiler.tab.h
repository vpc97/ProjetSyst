/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_COMPILER_TAB_H_INCLUDED
# define YY_YY_COMPILER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tID = 258,
    tPO = 259,
    tPF = 260,
    tAO = 261,
    tAF = 262,
    tMAIN = 263,
    tCONST = 264,
    tSTRING = 265,
    tINT = 266,
    tVAR = 267,
    tIF = 268,
    tWHILE = 269,
    tFOR = 270,
    tELSE = 271,
    tRETURN = 272,
    tDO = 273,
    tPRINTF = 274,
    tSCANF = 275,
    tMULT = 276,
    tSOUSTRACTION = 277,
    tADDITION = 278,
    tDIV = 279,
    tGUILLEMET = 280,
    tCROCHETGAUCHE = 281,
    tCROCHETDROIT = 282,
    tPOINTVIRGULE = 283,
    tVIRGULE = 284,
    tEGAL = 285,
    tDEGAL = 286,
    tDIF = 287,
    tPOINTEXCLAMATION = 288,
    tPOINTINTERROGATION = 289,
    tINF = 290,
    tSUP = 291,
    tINFEGAL = 292,
    tSUPEGAL = 293,
    tPLUSPLUS = 294,
    tMOINSMOINS = 295
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 10 "compiler.y" /* yacc.c:1909  */
 char* str; int nb;

#line 98 "compiler.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_COMPILER_TAB_H_INCLUDED  */
