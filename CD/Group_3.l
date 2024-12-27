%{
#include <stdio.h>
int yywrap(void) { return 1; }  // Correct yywrap definition
%}

%%
"if"          { printf("Keyword: if\\n"); }
"for"         { printf("Keyword: for\\n"); }
"int"         { printf("Keyword: int\\n"); }
"return"      { printf("Keyword: return\\n"); }
[0-9]+        { printf("Literal: %s\\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\\n", yytext); }
"=="|"!="|"<="|">="|"<"|">" { printf("Operator: %s\\n", yytext); }
"="|"+"|"-"|"*"|"/"         { printf("Operator: %s\\n", yytext); }
";"|","|"("|")"|"{"|"}"     { printf("Punctuation: %s\\n", yytext); }
[ \\t\\n]+    { /* Ignore whitespace */ }
.             { printf("Unknown token: %s\\n", yytext); }

%%
int main() {
    yylex();
    return 0;
}
