grammar visualg;

prog: 
	(ALGORITMO STRING (COMENTARIO|COMENTARIO_MULTILINHA)* variaveis_globais? (constCaractere| constNumerico	| constBool | constVet| funcoes)* INICIO  expressoes*  FIM_ALGORITMO) EOF;

variaveis_globais: 
	VAR (lista_de_variaveis DOIS_PONTOS tipo_da_variavel)*;

variaveis_locais: 
	(lista_de_variaveis DOIS_PONTOS tipo_da_variavel)*;

funcoes: 
	DECLARACAO_FUNCAO VARIAVEL parametros DOIS_PONTOS (TIPO_DE_DADO | VOID) (COMENTARIO|COMENTARIO_MULTILINHA)* variaveis_locais INICIO expressoes* RETORNO ((calculo|lista_de_variaveis|chamar_funcao)+|VOID) FIM_FUNCAO;

parametros: 
	 ABRE_PARENTESES VAR? lista_de_variaveis DOIS_PONTOS TIPO_DE_DADO (PONTO_VIRGULA VAR? lista_de_variaveis DOIS_PONTOS TIPO_DE_DADO)* FECHA_PARENTESES;

//falta adicionar a função DEBUG
expressoes: 
	escreva
	| leia 
	| desvio_condicional 
	| selecao_multipla 
	| para_faca 
	| enquanto_faca
	| repita_ate
	| arquivo
	| aleatorio
	| timer
	| INTERROMPA
	| COMENTARIO
	| PAUSA
	| ECO
	| CRONOMETRO
	| LIMPATELA
	| chamar_funcao
	| constCaractere
	| constNumerico
	| constVet
	| constBool;

chamar_funcao: 
	VARIAVEL (lista_de_variaveis|chamar_funcao)+ FECHA_PARENTESES;

constCaractere: 
    VARIAVEL ATRIBUIR STRING;

constNumerico:
    VARIAVEL ATRIBUIR calculo;

constBool:
	VARIAVEL ATRIBUIR BOOL;

constVet:
	MATRIZ ATRIBUIR calculo;

escreva: 
	ESCREVA ABRE_PARENTESES (STRING | calculo | print_variavel) ((VIRGULA|'+') (STRING | calculo | print_variavel | VARIAVEL))* FECHA_PARENTESES;

leia:
	LEIA ABRE_PARENTESES lista_de_variaveis FECHA_PARENTESES;

desvio_condicional:
	SE expressao_logica ENTAO expressoes* (SENAO expressoes*)? FIM_SE;

selecao_multipla:
	ESCOLHA VARIAVEL (CASO selecao_escolha expressoes*) + (OUTRO_CASO expressoes*)? FIM_ESCOLHA;

para_faca:
	PARA VARIAVEL DE INTEIRO+ ATE INTEIRO+ (PASSO incremento)? FACA expressoes* FIM_PARA;

enquanto_faca: 
	ENQUANTO expressao_logica FACA expressoes* FIM_ENQUANTO;

repita_ate:
	REPITA expressoes*  ATE expressao_logica;

aleatorio: 
	ALEATORIO (ABRE_COLCHETES ON FECHA_COLCHETES | ABRE_COLCHETES OFF FECHA_COLCHETES | INTEIRO* VIRGULA? INTEIRO);

arquivo: ARQUIVO NOME_ARQUIVO;

timer: TIMER (ABRE_COLCHETES ON FECHA_COLCHETES | ABRE_COLCHETES OFF FECHA_COLCHETES | INTEIRO*);

lista_de_variaveis: 
	VARIAVEL (VIRGULA VARIAVEL)*;

lista_de_intervalo: 
	ABRE_COLCHETES intervalo FECHA_COLCHETES;

tipo_da_variavel: 
	TIPO_DE_DADO | tipo_vetor;

tipo_vetor: 
	VETOR lista_de_intervalo DE TIPO_DE_DADO;

intervalo: 
	INTEIRO+ PONTO_PONTO INTEIRO+ (VIRGULA INTEIRO+ PONTO_PONTO INTEIRO)*;

print_variavel: 
	calculo (DOIS_PONTOS INTEIRO+)(DOIS_PONTOS INTEIRO+)?;

calculo: 
	(expressao_aritmetica | expressao_logica);

expressao_aritmetica:
	ABRE_PARENTESES? 
		OPERADOR_UNARIO? selecao_aritmetica 
		(
			(OPERADOR_BINARIO|'+'|'-') 
			ABRE_PARENTESES? 
				OPERADOR_UNARIO? selecao_aritmetica 
			FECHA_PARENTESES?
		)* 
	FECHA_PARENTESES?;

expressao_logica:
	ABRE_PARENTESES? OPERADOR_UNARIO? selecao_logica (OPERADOR_RELACIONAL ABRE_PARENTESES? OPERADOR_UNARIO? selecao_logica FECHA_PARENTESES? (OPERADOR_LOGICO selecao_logica (OPERADOR_RELACIONAL ABRE_PARENTESES? OPERADOR_UNARIO? selecao_logica FECHA_PARENTESES?)?)*)? FECHA_PARENTESES?;

selecao_aritmetica: 
	VARIAVEL | INTEIRO | REAL | MATRIZ;
selecao_logica: 
	VARIAVEL | INTEIRO | REAL | BOOL;
selecao_escolha: 
	INTEIRO | REAL | STRING | BOOL;

incremento: 
	'-'? INTEIRO+;

// DIGIT
fragment DIGIT: [0-9];

TIPO_DE_DADO: 'inteiro' | 'real' | 'caractere' | 'logico';

//OPERADORES
//ERRO COM '%', VERIFICAR COMO TRATAR "\" E "^"

OPERADOR_BINARIO: '+' | '-' | '*' | '/' | 'mod' | '^' | '\\';
OPERADOR_RELACIONAL: '>' | '<' | '<=' | '>=' | '=' | '<>';
OPERADOR_LOGICO: 'nao' | 'ou' | 'e' | 'xou';
OPERADOR_UNARIO: '+'| '-';

//IDS
INICIO: 'inicio';
FIM_ALGORITMO: 'fimalgoritmo';
ALGORITMO: 'algoritmo';
VOID: 'void';
COMENTARIO: '//' (.)*? '\n' -> skip;
COMENTARIO_MULTILINHA: '/*' (.)*? '*/' -> skip;
STRING: ["][a-zA-Z0-9 $&+,:;=?@#|'<>.^*()%-]+ ["];
VETOR: 'vetor';
MATRIZ: VARIAVEL ABRE_COLCHETES INTEIRO (VIRGULA INTEIRO)* FECHA_COLCHETES;
DE: 'de';
ABRE_COLCHETES: '[';
FECHA_COLCHETES: ']';
ABRE_PARENTESES: '(';
FECHA_PARENTESES: ')';
VIRGULA: ',';
ATRIBUIR: '<-';
INTEIRO: [-]?DIGIT+;
REAL: [-]?DIGIT+ ([.]DIGIT+)?;
BOOL: 'FALSO' | 'VERDADEIRO';
PONTO_PONTO: '..';
ESCREVA: 'escreva' | 'escreval';
LEIA: 'leia';
SE: 'se';
ENTAO: 'entao';
SENAO: 'senao';
FIM_SE: 'fimse';
ESCOLHA: 'escolha';
CASO: 'caso';
OUTRO_CASO: 'outrocaso';
FIM_ESCOLHA: 'fimescolha';
PARA: 'para';
ATE: 'ate';
FACA: 'faca';
FIM_PARA: 'fimpara';
REPITA: 'repita';
ENQUANTO: 'enquanto';
FIM_ENQUANTO: 'fimenquanto';
INTERROMPA: 'interrompa';
RETORNO: 'retorne';
FIM_FUNCAO: 'fimfuncao';
PONTO_VIRGULA: ';';
VAR: 'var';
ON: 'on';
OFF: 'off';
ARQUIVO: 'arquivo';
NOME_ARQUIVO: ["][a-zA-Z0-9 $&+,:;=?@#|'<>.^*()%-]+.[a-zA-Z0-9]+["];
PAUSA: 'pausa';
ECO: ON | OFF;
CRONOMETRO: ON | OFF;
LIMPATELA: 'limpatela';
DOIS_PONTOS: ':';
ALEATORIO: 'aleatorio';
TIMER: 'timer';
PASSO: 'passo';
BARRA_BARRA: '//';
DECLARACAO_FUNCAO: 'funcao ';
VARIAVEL: [a-zA-Z]+ [_a-zA-Z0-9]*;
WS : [ \t\r\n]+ -> skip ;
ENTER : '\r'? '\n' -> skip ;