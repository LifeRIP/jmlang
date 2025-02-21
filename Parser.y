%{
  #include <stdio.h>
  #include <stdlib.h>
  int yylex();
  void yyerror(const char *s);

  struct var_type {
    char *name;
    int value;
  };

  struct var_type vars[100];
  int var_count = 0;

  int get_var(char *name) {
    for (int i = 0; i < var_count; i++) {
      if (strcmp(vars[i].name, name) == 0) {
        return vars[i].value;
      }
    }
    return -1;
  }

  void set_var(char *name, int value) {
    for (int i = 0; i < var_count; i++) {
      if (strcmp(vars[i].name, name) == 0) {
        vars[i].value = value;
        return;
      }
    }
    vars[var_count].name = name;
    vars[var_count].value = value;
    var_count++;
  }
%}

%union {
    int intval;
    char *strval;
}

%token <intval> ISANT;
%token <strval> ISAFICADOR;
%token DANIF;
%token ENTONCES;
%token MANUELSE;
%token CAMILOR;
%token HACEJOAN;
%token MIENTRASJOAN;
%token EQ;
%token TRUE;
%token FALSE;
%type <intval> expr stmt


%start program
/* Rule Section */
%%
program:
    | program stmt
    ;

stmt:
    ISAFICADOR '=' expr ';'
    {
      set_var($1, $3);
      printf("La variable %s es igual a %d\n", $1, $3);
    }
    | DANIF expr ENTONCES expr ';'
    {
      if ($2) { 
        $$ = $4; 
        printf("Resultado del IF: %d\n", $4); 
      }
    }
    | DANIF expr ENTONCES expr MANUELSE expr ';'
    {
      if ($2) {
        $$ = $4;
        printf("Resultado del IF: %d\n", $4);
      } else {
        $$ = $6;
        printf("Resultado del ELSE: %d\n", $6);
      }
    }
    | CAMILOR  expr ':' expr HACEJOAN expr ';'
    {
      int start = $2;
      int end = $4;
      for (int i = start; i <= end; i++) {
        printf("Resultado del ciclo FOR: %d\n", $6);
        $6;
      }
    }
    | MIENTRASJOAN expr HACEJOAN expr ';'
    {
      int cont = 0;
      while ($2) {
        printf("Resultado del ciclo WHILE: %d\n", $4);
        $4;
        cont++;
        if(cont==8){
          printf("Ciclo WHILE parado para no agotar la memoria");
          break;
        }
      }
    }
    | expr ';'
    {
      printf("Resultado de la expresion: %d\n", $1);
    }
    ;

expr:
  ISANT
  { $$ = $1; }
  | ISAFICADOR
  { $$ = get_var($1); }
  | expr '>' expr
  { $$ = $1 > $3; }
  | expr '<' expr
  { $$ = $1 < $3; }
  | expr EQ expr
  { $$ = $1 == $3; }
  | expr '+' expr
  { $$ = $1 + $3; }
  | expr '-' expr
  { $$ = $1 - $3; }
  | expr '*' expr
  { $$ = $1 * $3; }
  | expr '/' expr
  { $$ = $1 / $3; }
  | '(' expr ')'
  { $$ = $2; }
  | TRUE
  { $$ = 1; }
  | FALSE
  { $$ = 0; }
  | ISAFICADOR '=' expr
  {
    set_var($1, $3);
    $$ = get_var($1);
  }
  ;
%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "error: %s\n", s);
}
