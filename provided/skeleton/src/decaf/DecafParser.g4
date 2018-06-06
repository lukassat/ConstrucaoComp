
parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CS PG corpo_classe;

corpo_classe: LCURLY  field_decl*method_decl* RCURLY ;

//field: type ID | type ID LBRACKET int_literal RBRACKET;

//field_decl: field (field VIRGULA)* PONTOVIR;

//field_decl: par (VIRGULA par)* PONTOVIR|type ID LBRACKET int_literal RBRACKET (VIRGULA par LBRACKET int_literal RBRACKET)* PONTOVIR;

field_decl: type ID (VIRGULA par)* PONTOVIR|type ID LBRACKET int_literal RBRACKET (VIRGULA par LBRACKET int_literal RBRACKET)* PONTOVIR;

method_decl: (type | VOID) ID LPARENT (par(VIRGULA par)*)? RPARENT block;

par:type ID;

//block:LCURLY (var)* (statement)* RCURLY;
block:LCURLY (var|statement)* RCURLY;


var: type ID (variaveis)*PONTOVIR;
variaveis: VIRGULA ID;

type: INT|BL;

statement:location assign_op expr PONTOVIR
		|method_call PONTOVIR
		|SE LPARENT expr RPARENT block (ELSE block)?
		|PARA ID assign_op expr VIRGULA expr block
		|RETORNO (expr)? PONTOVIR
		|BREAK PONTOVIR
		|CONTINUE PONTOVIR
		|block;

assign_op:ATRIBUICAO
	 |DECREMENTO
	 |INCREMENTO;

method_call:method_name LPARENT (expr(VIRGULA expr)*)? RPARENT
	|CL LPARENT(string_literal(VIRGULA call_arg(VIRGULA call_arg)*)?) RPARENT;

method_name:ID;

location: ID
	  |ID LBRACKET expr RBRACKET;

expr: location|method_call
      |literal
      |expr bin_op expr
      |SUB expr
      | EXCL expr
      |LPARENT expr RPARENT;

bin_op: op_arit
        |op_comp
        |op_igual_dif
        |op_log;

call_arg: expr|string_literal;

literal: int_literal|char_literal|bool_literal;

int_literal: dec|hex;
dec: DIGITO;
hex: HEXA;
bool_literal: VERDADEIRO|FALSO;
char_literal: CHARLITERAL;
string_literal: STRINGLITERAL;


op_arit:MULT|DIV|SUB|SUM|REST|EXP;
op_comp: MAIOR|MENOR|MAIORIG|MENORIG;
op_igual_dif:IGUALDADE|DIFERENTE;
op_log: AND|OR;
