%{
#include <stdio.h>
int regs[26];
int base;
int quizzes;
int labs; 
int reflections;
int total;
quizzes = 0;
labs = 0;
reflections = 0;
int yylex();
%}
%start list
%token DIGIT LETTER
%left '|'
%left '&'
%left '+' '-'
%left '*' '/' '%'
%left UMINUS  /*supplies precedence for unary minus */
%%                   /* beginning of rules section */
list:                       /*empty */
         |
        list stat '\n'
         |
        list error '\n'
         {
           yyerrok;
         }
         ;
stat:    expr
         {
           printf("=> %d\n",$1);
         }
         |
         LETTER '=' expr
         {
           regs[$1] = $3;
         }
         |
         LETTER expr ',' expr ',' expr
         {
           regs[$1] = $2 + $4 + $6;
           if ((yyval + 'a') == 'q') {      //  if LETTER is 'q'
             quizzes = regs[$1];
             printf("Q %d\n", quizzes);
           }
           else if ((yyval + 'a') == 'l') {  //  if LETTER is 'l'
             labs = regs[$1];
             printf("L %d\n", labs);
           }
           else if ((yyval + 'a') == 'r') {  //  if LETTER is 'r'
             reflections = regs[$1];
             printf("R %d\n", reflections);
           }
         }
         ;
expr:    '(' expr ')'
         {
           $$ = $2;
         }
         |
         expr '*' expr
         {
           $$ = $1 * $3;
         }
         |
         expr '/' expr
         {
           $$ = $1 / $3;
         }
         |
         expr '%' expr
         {
           $$ = $1 % $3;
         }
         |
         expr '+' expr
         {
           $$ = $1 + $3;
         }
          |
         expr '-' expr
         {
           $$ = $1 - $3;
         }
         |
         expr '&' expr
         {
           $$ = $1 & $3;
         }
         |
         expr '|' expr
         {
           $$ = $1 | $3;
         }
         |
        '-' expr %prec UMINUS
         {
           $$ = -$2;
         }
         |
         LETTER
         {
           //printf("Here is a message printing for the purpose of debugging.\n");
           if ((yyval + 'a') == 't') {
             printf("Quiz total is %d\n", quizzes);
             printf("Reflection total is %d\n", reflections);
             printf("Lab total is %d\n", labs);
           }
           if ((yyval + 'a') == 'x') {
             quizzes = 0;
             reflections = 0;
             labs = 0;
             printf("Category sums reset. Ready for next student.\n");
           }
           $$ = ((yylval + 'a') == 't') ? (quizzes + reflections + labs) : regs[$1];  // Tryin to write real c-y!
         }
         |
         number
         ;
number:  DIGIT
         {
           $$ = $1;
           base = ($1==0) ? 8 : 10;
         }       |
         number DIGIT
         {
           $$ = base * $1 + $2;
         }
         ;
%%
main()
{
 return(yyparse());
}
yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}
yywrap()
{
  return(1);
}