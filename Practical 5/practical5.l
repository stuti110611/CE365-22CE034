%{
#include <stdio.h>
#include <stdlib.h>

FILE *input_file;
extern FILE *yyin;
%}

%option noyywrap

%%

 /* Whitespace handling */
[ \t\r\n]+            { /* Ignore whitespaces */ }

 /* Comments */
"//".*                { /* Ignore single-line comments */ }
"/"(.|\n)?"/"      { / Ignore multi-line comments */ }

 /* Keywords */
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
    printf("Keyword: %s\n", yytext);
}

 /* Identifiers */
[A-Za-z_][A-Za-z0-9_]* {
    printf("Identifier: %s\n", yytext);
}

 /* Constants */
0[xX][0-9a-fA-F]+     { printf("Hex Constant: %s\n", yytext); }
0[0-7]+               { printf("Octal Constant: %s\n", yytext); }
[0-9]+                { printf("Integer Constant: %s\n", yytext); }
[0-9]*\.[0-9]+([eE][-+]?[0-9]+)? { printf("Float Constant: %s\n", yytext); }

 /* String Literals */
\"([^"\\\n]|\\.)*\"   { printf("String Literal: %s\n", yytext); }
\'([^'\\\n]|\\.)*\'   { printf("Character Literal: %s\n", yytext); }

 /* Operators */
"=="|"!="|"<="|">="|"&&"|"||"|"<<"|">>"|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"^="|"->"|"++"|"--" {
    printf("Operator: %s\n", yytext);
}
[+\-*/%=&|^<>!~] {
    printf("Operator: %s\n", yytext);
}

 /* Punctuation */
[(){}[\],;:.]  {
    printf("Punctuation: %s\n", yytext);
}

 /* Invalid characters */
.  { printf("Invalid: %s\n", yytext); }

%%

int main() {
    input_file = fopen("practical_3.c", "r");
    if (!input_file) {
        printf("Error: Could not open file practical3.c\n");
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);
    return 0;
}