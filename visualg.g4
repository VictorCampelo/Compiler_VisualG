grammar visualg;

prog: 
	(ALGORITMO STRING COMENTARIO* variaveis_globais (procedimentos | funcoes)* INICIO expressoes* FIM) EOF;

variaveis_globais: 
	(lista_de_variaveis DOIS_PONTOS tipo_da_variavel)*;

variaveis_locais: 
	(lista_de_variaveis DOIS_PONTOS tipo_da_variavel)*;

procedimento:
	PROCEDIMENTO nome_do_procedimento PARAMETROS COMENTARIO* variaveis_locais INICIO expressoes* FIM_PROCEDIMENTO;

funcoes: 
	FUNCAO nome_da_funcao PARAMETROS DOIS_PONTOS TIPO_DE_DADO COMENTARIO* variaveis_locais INICIO expressoes* RETORNO lista_de_variaveis FIM_FUNCAO;

PARAMETROS: 
	VAR? ABRE_PARENTESES lista_de_variaveis DOIS_PONTOS TIPO_DE_DADO (PONTO_VIRGULA lista_de_variaveis DOIS_PONTOS TIPO_DE_DADO)* FECHA_PARENTESES;

nome_do_procedimento: 
	NOME_DA_VARIAVEL;
nome_da_funcao: 
	NOME_DA_VARIAVEL;

expressoes:
	atribuicao 
	| escreva
	| leia 
	| desvio_condicional 
	| selecao_multipla 
	| para_faca 
	| enquanto_faca
	| repita_ate
	| INTERROMPA
	| COMENTARIO;

atribuicao: constCaractere | constNumerico | constBool;

constCaractere: 
    NOME_DA_VARIAVEL ATRIBUIR STRING;

constNumerico:
    NOME_DA_VARIAVEL ATRIBUIR calculo;

constBool:
	NOME_DA_VARIAVEL ATRIBUIR BOOL;

escreval: 
	ESCREVA ABRE_PARENTESES (STRING | calculo | print_variavel) (VIRGULA (STRING | calculo | print_variavel))* FECHA_PARENTESES;

leia:
	LEIA ABRE_PARENTESES lista_de_variaveis FECHA_PARENTESES;

desvio_condicional:
	SE expressao_logica ENTAO expressoes (SENAO expressoes)? FIM_SE

selecao_multipla:
	ESCOLHA NOME_DA_VARIAVEL (CASO selecao_escolha expressoes) + (OUTRO_CASO expressoes)? FIM_ESCOLHA;

para_faca:
	PARA NOME_DA_VARIAVEL DE DIGIT+ ATE DIGIT+ (PASSO incremento)? FACA expressoes FIM_PARA;

enquanto_faca: 
	ENQUANTO expressao_logica FACA expressoes FIM_ENQUANTO;

repita_ate:
	REPITA expressoes ATE expressao_logica;


lista_de_variaveis: 
	NOME_DA_VARIAVEL (VIRGULA NOME_DA_VARIAVEL)*;
lista_de_intervalo: 
	ABRE_COLCHETES intervalo FECHA_COLCHETES;

tipo_da_variavel: 
	TIPO_DE_DADO | tipo_vetor;
tipo_vetor: 
	VETOR: lista_de_intervalo DE TIPO_DE_DADO;

intervalo: 
	DIGIT+ PONTO_PONTO DIGIT+ (VIRGULA DIGIT+ PONTO_PONTO DIGIT)*;

print_variavel: 
	NOME_DA_VARIAVEL (DOIS_PONTOS DIGIT+){ ,2};

calculo: 
	expressao_aritmetica | expressao_logica;

expressao_aritmetica:
	ABRE_PARENTESES? OPERADOR_UNARIO? expressao_selecao ((OPERADOR_BINARIO ABRE_PARENTESES? OPERADOR_UNARIO? expressao_selecao FECHA_PARENTESES?)* FECHA_PARENTESES?;

expressao_logica:
	ABRE_PARENTESES? OPERADOR_UNARIO? expressao_selecao (OPERADOR_RELACIONAL ABRE_PARENTESES? OPERADOR_LOGICO? OPERADOR_UNARIO? expressao_selecao FECHA_PARENTESES?)* FECHA_PARENTESES?;

selecao_aritmetica: 
	NOME_DA_VARIAVEL| INTEIRO | REAL;
selecao_logica: 
	NOME_DA_VARIAVEL| INTEIRO | REAL | BOOL;
selecao_escolha: 
	INTEIRO | REAL | STRING | BOOL;

incremento: 
	MENOS? DIGIT+;

// DIGIT
fragment DIGIT: [0-9];

TIPO_DE_DADO: 'inteiro' | 'real' | 'caractere' | 'logico';

//OPERADORES
OPERADOR_BINARIO: '+'| '-'| '*'| '/'| '\'| 'MOD'| '%';
OPERADOR_RELACIONAL: '>'| '<'| '<='| '>='| '='| '<>';
OPERADOR_LOGICO: 'nao' | 'ou' | 'e' | 'xou';
OPERADOR_UNARIO: '+'| '-';

//IDS
INICIO: 'inicio';
FIM_ALGORITMO: 'fimAlgoritmo';
ALGORITMO: 'algoritmo';
NOME_DA_VARIAVEL: [a-zA-Z]+ [_a-zA-Z0-9]*;
COMENTARIO: '//' (.)*? '\n' -> skip;
STRING: ["][a-zA-Z0-9 $&+,:;=?@#|'<>.^*()%-]+ ["];
VETOR: 'vetor';
DE: 'de';
ABRE_COLCHETES: '[';
FECHA_COLCHETES: ']';
VIRGULA: ',';
ATRIBUIR: '<-';
INTEIRO: DIGIT+;
REAL: DIGIT+ ([.]DIGIT+)?;
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
MENOS: '-';
PARA: 'para';
ATE: 'ate';
FACA: 'faca';
FIM_PARA: 'fimpara';
ENQUANTO: 'enquanto';
FIM_ENQUANTO: 'fimenquanto';
INTERROMPA: 'interrompa';
PROCEDIMENTO: 'procedimento';
FIM_PROCEDIMENTO: 'fimprocedimento';
FUNCAO: 'funcao';
RETORNO: 'retorne';
FIM_FUNCAO: 'fimfuncao';
PONTO_VIRGULA: ';';