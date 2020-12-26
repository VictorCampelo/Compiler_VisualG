grammar visualg;

prog: 
	(ALGORITMO STRING COMENTARIO* variaveis_globais (procedimentos | funcoes)* INICIO expressoes* FIM_ALGORITMO) EOF;

variaveis_globais: 
	(lista_de_variaveis DOIS_PONTOS tipo_da_variavel)*;

variaveis_locais: 
	(lista_de_variaveis DOIS_PONTOS tipo_da_variavel)*;

procedimentos:
	PROCEDIMENTO NOME_DO_PROCEDIMENTO parametros COMENTARIO* variaveis_locais INICIO expressoes* FIM_PROCEDIMENTO;

funcoes: 
	FUNCAO NOME_DA_FUNCAO parametros DOIS_PONTOS TIPO_DE_DADO COMENTARIO* variaveis_locais INICIO expressoes* RETORNO (lista_de_variaveis|chamar_funcao)+ FIM_FUNCAO;

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
	| chamar_procedimento
	| chamar_funcao
	| constCaractere
	| constNumerico
	| constBool;

chamar_funcao: 
	NOME_DA_FUNCAO ABRE_PARENTESES (lista_de_variaveis|chamar_funcao)+ FECHA_PARENTESES;

chamar_procedimento: 
	NOME_DA_FUNCAO ABRE_PARENTESES (lista_de_variaveis|chamar_funcao)* FECHA_PARENTESES;

constCaractere: 
    NOME_DA_VARIAVEL ATRIBUIR STRING;

constNumerico:
    NOME_DA_VARIAVEL ATRIBUIR calculo;

constBool:
	NOME_DA_VARIAVEL ATRIBUIR BOOL;

escreva: 
	ESCREVA ABRE_PARENTESES (STRING | calculo | print_variavel) (VIRGULA (STRING | calculo | print_variavel))* FECHA_PARENTESES;

leia:
	LEIA ABRE_PARENTESES lista_de_variaveis FECHA_PARENTESES;

desvio_condicional:
	SE expressao_logica ENTAO expressoes* QUEBRA_LINHA* (SENAO expressoes* QUEBRA_LINHA*)? FIM_SE;

selecao_multipla:
	ESCOLHA NOME_DA_VARIAVEL (CASO selecao_escolha expressoes* QUEBRA_LINHA*) + (OUTRO_CASO expressoes* QUEBRA_LINHA*)? FIM_ESCOLHA;

para_faca:
	PARA NOME_DA_VARIAVEL DE DIGIT+ ATE DIGIT+ (PASSO incremento)? FACA expressoes* QUEBRA_LINHA* FIM_PARA;

enquanto_faca: 
	ENQUANTO expressao_logica FACA expressoes* QUEBRA_LINHA* FIM_ENQUANTO;

repita_ate:
	REPITA expressoes* QUEBRA_LINHA* ATE expressao_logica;

aleatorio: 
	ALEATORIO (ABRE_COLCHETES ON FECHA_COLCHETES | ABRE_COLCHETES OFF FECHA_COLCHETES | DIGIT* VIRGULA? DIGIT);

arquivo: ARQUIVO NOME_ARQUIVO;

timer: TIMER (ABRE_COLCHETES ON FECHA_COLCHETES | ABRE_COLCHETES OFF FECHA_COLCHETES | DIGIT*);

lista_de_variaveis: 
	NOME_DA_VARIAVEL (VIRGULA NOME_DA_VARIAVEL)*;

lista_de_intervalo: 
	ABRE_COLCHETES intervalo FECHA_COLCHETES;

tipo_da_variavel: 
	TIPO_DE_DADO | tipo_vetor;

tipo_vetor: 
	VETOR lista_de_intervalo DE TIPO_DE_DADO;

intervalo: 
	DIGIT+ PONTO_PONTO DIGIT+ (VIRGULA DIGIT+ PONTO_PONTO DIGIT)*;

print_variavel: 
	NOME_DA_VARIAVEL (DOIS_PONTOS DIGIT+){ ,2};

calculo: 
	(expressao_aritmetica | expressao_logica);

expressao_aritmetica:
	ABRE_PARENTESES? OPERADOR_UNARIO? selecao_aritmetica (OPERADOR_BINARIO ABRE_PARENTESES? OPERADOR_UNARIO? selecao_aritmetica FECHA_PARENTESES?)* FECHA_PARENTESES?;

expressao_logica:
	ABRE_PARENTESES? OPERADOR_UNARIO? selecao_logica (OPERADOR_RELACIONAL ABRE_PARENTESES? OPERADOR_LOGICO? OPERADOR_UNARIO? selecao_logica FECHA_PARENTESES?)* FECHA_PARENTESES?;

selecao_aritmetica: 
	NOME_DA_VARIAVEL| INTEIRO | REAL;
selecao_logica: 
	NOME_DA_VARIAVEL| INTEIRO | REAL | BOOL;
selecao_escolha: 
	INTEIRO | REAL | STRING | BOOL;

incremento: 
	'-'? DIGIT+;

// DIGIT
fragment DIGIT: [0-9];

TIPO_DE_DADO: 'inteiro' | 'real' | 'caractere' | 'logico';

//OPERADORES
//ERRO COM '%', VERIFICAR COMO TRATAR
OPERADOR_BINARIO: '+'| '-' | '*' | '/' | 'mod';
OPERADOR_RELACIONAL: '>' | '<' | '<=' | '>=' | '=' | '<>';
OPERADOR_LOGICO: 'nao' | 'ou' | 'e' | 'xou';
OPERADOR_UNARIO: '+'| '-';

//IDS
INICIO: 'inicio';
FIM_ALGORITMO: 'fimalgoritmo';
ALGORITMO: 'algoritmo';
COMENTARIO: BARRA_BARRA (.)*? QUEBRA_LINHA;
STRING: ["][a-zA-Z0-9 $&+,:;=?@#|'<>.^*()%-]+ ["];
VETOR: 'vetor';
DE: 'de';
ABRE_COLCHETES: '[';
FECHA_COLCHETES: ']';
ABRE_PARENTESES: '(';
FECHA_PARENTESES: ')';
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
REPITA: 'repita';
ENQUANTO: 'enquanto';
FIM_ENQUANTO: 'fimenquanto';
INTERROMPA: 'interrompa';
PROCEDIMENTO: 'procedimento';
FIM_PROCEDIMENTO: 'fimprocedimento';
FUNCAO: 'funcao';
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
QUEBRA_LINHA: '\n';
BARRA_BARRA: '//';
NOME_DA_VARIAVEL: [a-zA-Z]+ [_a-zA-Z0-9]*;
NOME_DO_PROCEDIMENTO: [a-zA-Z]+ [_a-zA-Z0-9]*;
NOME_DA_FUNCAO: [a-zA-Z]+ [_a-zA-Z0-9]*;
ESPACO: ' ';