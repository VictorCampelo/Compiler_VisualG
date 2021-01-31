# coding: utf-8

from antlr4.tree.Tree import TerminalNodeImpl
from visualgListener import visualgListener
from antlr4 import CommonTokenStream
from antlr4.tree.Trees import Trees
from visualgParser import visualgParser
from antlr4 import ParseTreeWalker
from visualgLexer import visualgLexer
from antlr4 import FileStream
from antlr4 import Token
import sys
import io
import os


representacao_arvore = ""


#def clear():
#    if os.name == 'nt':
#        os.system('cls')
#    else:
#        os.system('clear')


def gerar_arvore(tree, rule_names, indent=0):
    global representacao_arvore
    if tree.getText() == "<EOF>":
        return
    elif isinstance(tree, TerminalNodeImpl):
        representacao_arvore += ("    "*indent) + \
            f"TOKEN='{tree.getText()}'" + '\n'
    else:
        representacao_arvore += ("    "*indent) + \
            f"{rule_names[tree.getRuleIndex()]}" + '\n'
        for child in tree.children:
            gerar_arvore(child, rule_names, indent + 1)


def main(argv):
    global representacao_arvore

    #os.system('clear')

    input_stream = FileStream(argv[1], encoding='utf-8')
    output = open(argv[1]+".txt", "w")

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
            elif t == lexer.FIM_SE:
                tipo = "<FIM_SE>"
            # elif t == lexer.FUNCAO:
            #     tipo = "<FUNCAO>"
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
            elif t == lexer.NOME_ARQUIVO:
                tipo = "<NOME_ARQUIVO>"
            elif t == lexer.VARIAVEL:
                tipo = "<VARIAVEL>"
            elif t == lexer.DECLARACAO_FUNCAO:
                tipo = "<DECLARACAO_FUNCAO>"
            elif t == lexer.OFF:
                tipo = "<OFF>"
            elif t == lexer.ON:
                tipo = "<ON>"
            elif t == lexer.OUTRO_CASO:
                tipo = "<OUTRO_CASO>"
            elif t == lexer.OPERADOR_UNARIO:
                tipo = "<OPERADOR_UNARIO>"
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
            elif t == lexer.BARRA_BARRA:
                tipo = "<BARRA_BARRA>"
            elif t == lexer.VOID:
                tipo = "<VOID>"
            elif t == lexer.TIPO_DE_DADO:
                tipo = "<TIPO_DE_DADO>"
            elif t == lexer.OP_SOM:
                tipo = "<SOMA>"
            elif t == lexer.OP_SUB:
                tipo = "<SUBTRACAO>"
            elif t == lexer.OP_MUL:
                tipo = "<MULTIPLICACAO>"
            elif t == lexer.OP_DIV:
                tipo = "<DIVISAO>"
            elif t == lexer.OP_RES:
                tipo = "<RESTO>"
            elif t == lexer.OP_POT:
                tipo = "<POTENCIA>"
            elif t == lexer.OP_DIV_INT:
                tipo = "<DIVISAO INTEIRA>"
            elif t == lexer.OP_MAIOR:
                tipo = "<MAIOR>"
            elif t == lexer.OP_MAIOR_IGUAL:
                tipo = "<MAIOR_IGUAL>"
            elif t == lexer.OP_MENOR:
                tipo = "<MENOR>"
            elif t == lexer.OP_MENOR_IGUAL:
                tipo = "<MENOR IGUAL>"
            elif t == lexer.OP_IGUAL:
                tipo = "<IGUAL>"
            elif t == lexer.OP_DIFERENTE:
                tipo = "<DIFERENTE>"
            elif t == lexer.OP_NAO:
                tipo = "<NAO>"
            elif t == lexer.OP_OU:
                tipo = "<OU>"
            elif t == lexer.OP_E:
                tipo = "<E>"
            elif t == lexer.OP_XOU:
                tipo = "<XOU>"
            elif t == lexer.MATRIZ:
                tipo = "<MATRIZ>"
            if tipo != '':
                output.write(str((linha, tipo, token.text)) + "\n")
            else:
                output.write(str((linha, token.text)) + "\n")
        else:
            break


    output.write("--------------------------------------------\n\n")
    # Analisador Sintático
    input_stream = FileStream(argv[1], encoding='utf-8')
    lexer = visualgLexer(input_stream)
    tokens = CommonTokenStream(lexer)
    parser = visualgParser(tokens)
    tree = parser.prog()
    # gerar_arvore(tree, parser.ruleNames)
    print("ARVORE SINTÁTICA -----------\n")
    output.write("ARVORE SINTÁTICA -----------\n")

    output.write(str(Trees.toStringTree(tree, None, parser)) + "\n")
    print(str(Trees.toStringTree(tree, None, parser)) + "\n")

    output.write("--------------------------------------------\n\n")
    print("--------------------------------------------\n\n")

    output.close()

    print("Cheque agora o arquivo saida.txt na mesma pasta deste projeto para ver a saída mais detalhada")


if __name__ == '__main__':
    main(sys.argv)
