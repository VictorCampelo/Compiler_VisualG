from antlr4 import FileStream
from antlr4 import CommonTokenStream
from antlr4 import ParseTreeWalker
from antlr4 import Token
from antlr4.tree.Trees import Trees
from visualgLexer import visualgLexer
from visualgListener import visualgListener
from visualgParser import visualgParser
import os
import sys


class visualgPrintListener(visualgListener):
    def func(self):
        pass

def main(argv):
    os.system('clear')

    output = open("saida.txt", "w")

    input_stream = FileStream(argv[1], encoding='utf-8')
    output.write("ARQUIVO ------------------------------------\n")
    output.write(str(input_stream) + "\n")
    output.write("--------------------------------------------\n\n")

    # Analisador Léxico
    lexer = visualgLexer(input_stream)

    output.write("TOKENS -------------------------------------\n")
    while 1:
        token = lexer.nextToken()
        tipo = ''
        linha = ''
        if token.type != Token.EOF:
            t = token.type
            linha = token.line
            if t == lexer.ABRE_COLCHETES:
                tipo = "<ABRE_COLCHETES>"
            elif t == lexer.ABRE_PARENTESES:
                tipo = "<ABRE_PARENTESES>"
            elif t == lexer.ALEATORIO:
                tipo = "<ALEATORIO>"
            elif t == lexer.ALGORITMO:
                tipo = "<ALGORITMO>"
            elif t == lexer.ARQUIVO:
                tipo = "<ARQUIVO>"
            elif t == lexer.ATE:
                tipo = "<ATE>"
            elif t == lexer.ATRIBUIR:
                tipo = "<ATRIBUIR>"
            elif t == lexer.BOOL:
                tipo = "<BOOL>"
            elif t == lexer.CASO:
                tipo = "<CASO>"
            elif t == lexer.CRONOMETRO:
                tipo = "<CRONOMETRO>"
            elif t == lexer.DE:
                tipo = "<DE>"
            elif t == lexer.DOIS_PONTOS:
                tipo = "<DOIS_PONTOS>"
            elif t == lexer.ECO:
                tipo = "<ECO>"
            elif t == lexer.ENQUANTO:
                tipo = "<ENQUANTO>"
            elif t == lexer.ENTAO:
                tipo = "<ENTAO>"
            elif t == lexer.ESCOLHA:
                tipo = "<ESCOLHA>"
            elif t == lexer.ESCREVA:
                tipo = "<ESCREVA>"
            elif t == lexer.FACA:
                tipo = "<FACA>"
            elif t == lexer.FECHA_COLCHETES:
                tipo = "<FECHA_COLCHETES>"
            elif t == lexer.FECHA_PARENTESES:
                tipo = "<FECHA_PARENTESES>"
            elif t == lexer.FIM_ALGORITMO:
                tipo = "<FIM_ALGORITMO>"
            elif t == lexer.FIM_ENQUANTO:
                tipo = "<FIM_ENQUANTO>"
            elif t == lexer.FIM_ESCOLHA:
                tipo = "<FIM_ESCOLHA>"
            elif t == lexer.FIM_FUNCAO:
                tipo = "<FIM_FUNCAO>"
            elif t == lexer.FIM_PARA:
                tipo = "<FIM_PARA>"
            elif t == lexer.FIM_PROCEDIMENTO:
                tipo = "<FIM_PROCEDIMENTO>"
            elif t == lexer.FIM_SE:
                tipo = "<FIM_SE>"
            elif t == lexer.FUNCAO:
                tipo = "<FUNCAO>"
            elif t == lexer.INICIO:
                tipo = "<INICIO>"
            elif t == lexer.INTEIRO:
                tipo = "<INTEIRO>"
            elif t == lexer.INTERROMPA:
                tipo = "<INTERROMPA>"
            elif t == lexer.LEIA:
                tipo = "<LEIA>"
            elif t == lexer.LIMPATELA:
                tipo = "<LIMPATELA>"
            elif t == lexer.MENOS:
                tipo = "<MENOS>"
            elif t == lexer.NOME_ARQUIVO:
                tipo = "<NOME_ARQUIVO>"
            elif t == lexer.NOME_DA_VARIAVEL:
                tipo = "<NOME_DA_VARIAVEL>"
            elif t == lexer.OFF:
                tipo = "<OFF>"
            elif t == lexer.ON:
                tipo = "<ON>"
            elif t == lexer.OUTRO_CASO:
                tipo = "<OUTRO_CASO>"
            elif t == lexer.PARA:
                tipo = "<PARA>"
            elif t == lexer.PASSO:
                tipo = "<PASSO>"
            elif t == lexer.PAUSA:
                tipo = "<PAUSA>"
            elif t == lexer.PONTO_PONTO:
                tipo = "<PONTO_PONTO>"
            elif t == lexer.PONTO_VIRGULA:
                tipo = "<PONTO_VIRGULA>"
            elif t == lexer.PROCEDIMENTO:
                tipo = "<PROCEDIMENTO>"
            elif t == lexer.REAL:
                tipo = "<REAL>"
            elif t == lexer.REPITA:
                tipo = "<REPITA>"
            elif t == lexer.RETORNO:
                tipo = "<RETORNO>"
            elif t == lexer.SE:
                tipo = "<SE>"
            elif t == lexer.SENAO:
                tipo = "<SENAO>"
            elif t == lexer.STRING:
                tipo = "<STRING>"
            elif t == lexer.TIMER:
                tipo = "<TIMER>"
            elif t == lexer.VAR:
                tipo = "<VAR>"
            elif t == lexer.VETOR:
                tipo = "<VETOR>"
            elif t == lexer.VIRGULA:
                tipo = "<VIRGULA>"
            if tipo != '':
                output.write(str((linha, tipo, token.text)) + "\n")
            else:
                output.write(str((linha, token.text)) + "\n")
        else:
            break

    output.write("--------------------------------------------\n\n")
   
    output.close()

if __name__ == '__main__':
    main(sys.argv)
