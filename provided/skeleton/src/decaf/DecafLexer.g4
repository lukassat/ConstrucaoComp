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

SUB : '-';
SUM : '+';
MULT : '*';
DIV : '/';
RESTO : '%';


DIGIT : [0-9];

NUMBER : DIGIT* | SUB DIGIT;

LETTER : [a-z, A-Z];

ID : ('_' | LETTER | LETTER DIGIT)*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//'[^\n]* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');
