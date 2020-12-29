%{
  #include <iostream>
  #include <sstream>

  void yyerror(const char* m);
  extern int yylex();
  extern FILE* yyin;
  #include <stdio.h>
  #include <string.h>
  #include <map>
  #include <fstream>
  #include <string>
  using namespace std;

  int line = 1;
  int stringNumber = 0;
  int count1 = 0;
  int temp;

  map<string, string> table;
  map<string, string> env;
  map<string, string> variables;
  map<string, string> tVariables;
  bool printByTokenName;
  bool printTepsilon;
  char typecheck[100];
  string output = "\n";


  typedef struct tnode {
    char valname[100];
	char valname2[100];
	char valname3[100];
    char token[100];
	char token2[100];
	char token3[100];
	bool isshow;
	bool lastchild;
	struct tnode *child;
    struct tnode *ptr;
    }tnode;

	tnode* CreateTnode();
	tnode* ProgramNode(tnode* push, tnode* t);
	tnode* ProgramNode(string valname, string token, tnode* t);
	void yyerror(int m);
	void yyerror(int m, string m1);
	void printtree(tnode *s);
	tnode *NTnode=NULL;

%}

%union{
    char* string;
    struct tnode *node;
}

%token <string> TOKEN_WHITESPACEspace TOKEN_WHITESPACEtab TOKEN_WHITESPACEnewLine;
%token <string> TOKEN_MOVCMD TOKEN_REG TOKEN_OPHD TOKEN_ADDCMD;
%token <string> TOKEN_COMMENT TOKEN_COMMA;

%type <node> MOVFUNC;
%type <node> ADDFUNC;

MOVFUNC:   TOKEN_MOVCMD TOKEN_REG TOKEN_COMMA TOKEN_OPHD
{
    tnode *a = CreateTnode;
    strcpy(a->token,"MOVFUNC");
    a = ProgramNode($1, "TOKEN_MOVCMD", a);
    a = ProgramNode($2, "TOKEN_REG", a);
    a = ProgramNode($3, "TOKEN_COMMA", a);
    a = ProgramNode($4, "TOKEN_OPHD", a);

    $$ = a;
}

ADDFUNC:    TOKEN_ADDCMD TOKEN_OPHD TOKEN_COMMA TOKEN_OPHD
{
    tnode *a = CreateTnode;
    strcpy(a->token,"ADDFUNC");
    a = ProgramNode($1, "TOKEN_ADDCMD", a);
    a = ProgramNode($2, "TOKEN_OPHD", a);
    a = ProgramNode($3, "TOKEN_COMMA", a);
    a = ProgramNode($4, "TOKEN_OPHD", a);

    $$ = a;
}