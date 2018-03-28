
lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';
LPARENT:'(';
RPARENT:')';
LBRACKET:'[';
RBRACKET:']';
PONTOVIR:';';
VIRGULA :',';
MULT:'*';
DIV:'/';
SUB: '-';
SUM: '+';
EXP:'^';
REST:'%';
EXCL:'!';
AND: '&&';
OR: '||';
IGUALDADE:'==';
DIFERENTE:'!=';
MAIOR: '>';
MENOR: '<';
MAIORIG:'>=';
MENORIG: '<=';
INCREMENTO: '+=';
DECREMENTO:'-=';
ATRIBUICAO:'=';
PG : 'program';
BL : 'boolean';
CL : 'callout';
CS : 'class';
ELSE : 'else';
SE : 'if';
FALSO : 'false';
INT : 'int';
RETORNO : 'return';
VERDADE : 'true';
VOID: 'void';
PARA : 'for';
BREAK : 'break';
CONTINUE : 'continue';
ENQUANTO : 'enquanto';
FACA : 'faca';


RESERVADOS: 'boolean'|'callout'|'class'|'else'|'false'|'if'|'int'|'return'|'true'|'void'|'for'|'forpar'|'break'|'continue';


CHARLITERAL: '\''(ESC|CHAR|ESPECIAL)'\'';
ESPECIAL: '#'|'$'|'&'|'.'|':'|'?'|'@'|'_'|'`'|'|'|'~';
HEXA: '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
DIGITO: [0-9]+;

ID:
  ('a'..'z' | 'A'..'Z' | DIGITO)+;


WS_: (' ' | '\n' ) -> skip;

COMETARIO : '//' (~'\n')* '\n' -> skip;


STRING : '"' (ESC~'"')* '"';


fragment ESC :  '\\' ( 'r' | 'n' | 't' | '\'' | '"' | 'p' | '\\');

fragment CHAR:('a'..'z'|'A'..'Z'|'0'..'9');

