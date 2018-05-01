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
PG : 'Program';
BL : 'boolean';
CL : 'callout';
CS : 'class';
ELSE : 'else';
SE : 'if';
FALSO : 'false';
INT : 'int';
RETORNO : 'return';
VERDADEIRO : 'true';
VOID: 'void';
PARA : 'for';
BREAK : 'break';
CONTINUE : 'continue';


CHARLITERAL: '\''(ESC|CHARC|ESPECIAL)'\'';
STRINGLITERAL: '"' (ESC|CHARC|RCURLY|LPARENT|RPARENT|LBRACKET|RBRACKET|PONTOVIR|VIRGULA MULT|DIV|SUB|SUM|EXP|REST|EXCL|AND|OR|IGUALDADE|DIFERENTE|MAIOR|MENOR|MAIORIG|MENORIG|INCREMENTO|DECREMENTO|ATRIBUICAO|PG|BL|CL|CS|ELSE|SE|FALSO|INT|RETORNO|VERDADEIRO|VOID|PARA|BREAK|CONTINUE|ESPECIAL|HEXA|DIGITO|LCURLY|'\\'|~('"'))*'"';

RESERVADOS: 'boolean'|'callout'|'class'|'else'|'false'|'if'|'int'|'return'|'true'|'void'|'for'|'break'|'continue';

ESPECIAL: '#'|'$'|'&'|':'|'?'|'@'|'_'|'`'|'|'|'~';
HEXA : '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
DIGITO: [0-9]+;


ID: ('_'| CHARC)('_'|CHARC|DIGITO)*;
WS_ : (' ' | '\n'|'\t') -> skip;

COMENTARIO : '//' (~'\n')* '\n' -> skip;

CHAR : '\''(' '..'!' | '#'..'&' | '('..'[' | ']'..'~' )'\'';
STRING : '"' (ESC~'"')* '"';
fragment CHARC:('a'..'z'|'A'..'Z'|'0'..'9');
fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;
