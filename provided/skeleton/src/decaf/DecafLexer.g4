
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
VERDADE: 'true';
VOID: 'void';
PARA : 'for';
BREAK : 'break';
CONTINUE : 'continue';
ENQUANTO : 'enquanto';
FACA : 'faca';


RESERVADOS: 'boolean'|'callout'|'class'|'else'|'false'|'if'|'int'|'return'|'true'|'void'|'for'|'break'|'continue';

STRINGLITERAL: '"' (ESC|CHAR|FACA|ENQUANTO|CONTINUE|BREAK|PARA|VOID|VERDADE|RETORNO|INT|FALSO|SE|ELSE|CS|CL|BL|PG|ATRIBUICAO|DECREMENTO|INCREMENTO|MENORIG|MAIORIG|MENOR|MAIOR|DIFERENTE|IGUALDADE|OR|AND|EXCL|REST|EXP|SUM|SUB|DIV|MULT|VIRGULA|PONTOVIR|RBRACKET|LBRACKET|RPARENT|LPARENT|RCURLY|LCURLY|'\\'|~('"'))*'"';

CHARLITERAL: '\''(ESC|CHAR|ESPECIAL)'\'';


ESPECIAL: '#'|'$'|'&'|':'|'?'|'@'|'_'|'`'|'|'|'~';
HEXA: '0x'(DIGITO|'a'..'f'|'A'..'F')+;
DIGITO: [0-9];


ID: ('_' | CHAR)('_'| CHAR |DIGITO)*;


WS_: (' ' | '\n'|'\t') -> skip;


COMENTARIO : '//' (~'\n')* '\n' -> skip;


STRING : '"' (ESC~'"')* '"';


fragment ESC :  '\\' ( 'r' | 'n' | 't' | '\'' | '"' |  '\\');

fragment CHAR:('a'..'z'|'A'..'Z'|'0'..'9');


