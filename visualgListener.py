# Generated from visualg.g4 by ANTLR 4.9.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .visualgParser import visualgParser
else:
    from visualgParser import visualgParser

# This class defines a complete listener for a parse tree produced by visualgParser.
class visualgListener(ParseTreeListener):

    # Enter a parse tree produced by visualgParser#prog.
    def enterProg(self, ctx:visualgParser.ProgContext):
        pass

    # Exit a parse tree produced by visualgParser#prog.
    def exitProg(self, ctx:visualgParser.ProgContext):
        pass


    # Enter a parse tree produced by visualgParser#variaveis_globais.
    def enterVariaveis_globais(self, ctx:visualgParser.Variaveis_globaisContext):
        pass

    # Exit a parse tree produced by visualgParser#variaveis_globais.
    def exitVariaveis_globais(self, ctx:visualgParser.Variaveis_globaisContext):
        pass


    # Enter a parse tree produced by visualgParser#variaveis_locais.
    def enterVariaveis_locais(self, ctx:visualgParser.Variaveis_locaisContext):
        pass

    # Exit a parse tree produced by visualgParser#variaveis_locais.
    def exitVariaveis_locais(self, ctx:visualgParser.Variaveis_locaisContext):
        pass


    # Enter a parse tree produced by visualgParser#funcoes.
    def enterFuncoes(self, ctx:visualgParser.FuncoesContext):
        pass

    # Exit a parse tree produced by visualgParser#funcoes.
    def exitFuncoes(self, ctx:visualgParser.FuncoesContext):
        pass


    # Enter a parse tree produced by visualgParser#parametros.
    def enterParametros(self, ctx:visualgParser.ParametrosContext):
        pass

    # Exit a parse tree produced by visualgParser#parametros.
    def exitParametros(self, ctx:visualgParser.ParametrosContext):
        pass


    # Enter a parse tree produced by visualgParser#expressoes.
    def enterExpressoes(self, ctx:visualgParser.ExpressoesContext):
        pass

    # Exit a parse tree produced by visualgParser#expressoes.
    def exitExpressoes(self, ctx:visualgParser.ExpressoesContext):
        pass


    # Enter a parse tree produced by visualgParser#chamar_funcao.
    def enterChamar_funcao(self, ctx:visualgParser.Chamar_funcaoContext):
        pass

    # Exit a parse tree produced by visualgParser#chamar_funcao.
    def exitChamar_funcao(self, ctx:visualgParser.Chamar_funcaoContext):
        pass


    # Enter a parse tree produced by visualgParser#constCaractere.
    def enterConstCaractere(self, ctx:visualgParser.ConstCaractereContext):
        pass

    # Exit a parse tree produced by visualgParser#constCaractere.
    def exitConstCaractere(self, ctx:visualgParser.ConstCaractereContext):
        pass


    # Enter a parse tree produced by visualgParser#constNumerico.
    def enterConstNumerico(self, ctx:visualgParser.ConstNumericoContext):
        pass

    # Exit a parse tree produced by visualgParser#constNumerico.
    def exitConstNumerico(self, ctx:visualgParser.ConstNumericoContext):
        pass


    # Enter a parse tree produced by visualgParser#constBool.
    def enterConstBool(self, ctx:visualgParser.ConstBoolContext):
        pass

    # Exit a parse tree produced by visualgParser#constBool.
    def exitConstBool(self, ctx:visualgParser.ConstBoolContext):
        pass


    # Enter a parse tree produced by visualgParser#constVet.
    def enterConstVet(self, ctx:visualgParser.ConstVetContext):
        pass

    # Exit a parse tree produced by visualgParser#constVet.
    def exitConstVet(self, ctx:visualgParser.ConstVetContext):
        pass


    # Enter a parse tree produced by visualgParser#escreva.
    def enterEscreva(self, ctx:visualgParser.EscrevaContext):
        pass

    # Exit a parse tree produced by visualgParser#escreva.
    def exitEscreva(self, ctx:visualgParser.EscrevaContext):
        pass


    # Enter a parse tree produced by visualgParser#leia.
    def enterLeia(self, ctx:visualgParser.LeiaContext):
        pass

    # Exit a parse tree produced by visualgParser#leia.
    def exitLeia(self, ctx:visualgParser.LeiaContext):
        pass


    # Enter a parse tree produced by visualgParser#desvio_condicional.
    def enterDesvio_condicional(self, ctx:visualgParser.Desvio_condicionalContext):
        pass

    # Exit a parse tree produced by visualgParser#desvio_condicional.
    def exitDesvio_condicional(self, ctx:visualgParser.Desvio_condicionalContext):
        pass


    # Enter a parse tree produced by visualgParser#selecao_multipla.
    def enterSelecao_multipla(self, ctx:visualgParser.Selecao_multiplaContext):
        pass

    # Exit a parse tree produced by visualgParser#selecao_multipla.
    def exitSelecao_multipla(self, ctx:visualgParser.Selecao_multiplaContext):
        pass


    # Enter a parse tree produced by visualgParser#para_faca.
    def enterPara_faca(self, ctx:visualgParser.Para_facaContext):
        pass

    # Exit a parse tree produced by visualgParser#para_faca.
    def exitPara_faca(self, ctx:visualgParser.Para_facaContext):
        pass


    # Enter a parse tree produced by visualgParser#enquanto_faca.
    def enterEnquanto_faca(self, ctx:visualgParser.Enquanto_facaContext):
        pass

    # Exit a parse tree produced by visualgParser#enquanto_faca.
    def exitEnquanto_faca(self, ctx:visualgParser.Enquanto_facaContext):
        pass


    # Enter a parse tree produced by visualgParser#repita_ate.
    def enterRepita_ate(self, ctx:visualgParser.Repita_ateContext):
        pass

    # Exit a parse tree produced by visualgParser#repita_ate.
    def exitRepita_ate(self, ctx:visualgParser.Repita_ateContext):
        pass


    # Enter a parse tree produced by visualgParser#aleatorio.
    def enterAleatorio(self, ctx:visualgParser.AleatorioContext):
        pass

    # Exit a parse tree produced by visualgParser#aleatorio.
    def exitAleatorio(self, ctx:visualgParser.AleatorioContext):
        pass


    # Enter a parse tree produced by visualgParser#arquivo.
    def enterArquivo(self, ctx:visualgParser.ArquivoContext):
        pass

    # Exit a parse tree produced by visualgParser#arquivo.
    def exitArquivo(self, ctx:visualgParser.ArquivoContext):
        pass


    # Enter a parse tree produced by visualgParser#timer.
    def enterTimer(self, ctx:visualgParser.TimerContext):
        pass

    # Exit a parse tree produced by visualgParser#timer.
    def exitTimer(self, ctx:visualgParser.TimerContext):
        pass


    # Enter a parse tree produced by visualgParser#lista_de_variaveis.
    def enterLista_de_variaveis(self, ctx:visualgParser.Lista_de_variaveisContext):
        pass

    # Exit a parse tree produced by visualgParser#lista_de_variaveis.
    def exitLista_de_variaveis(self, ctx:visualgParser.Lista_de_variaveisContext):
        pass


    # Enter a parse tree produced by visualgParser#lista_de_intervalo.
    def enterLista_de_intervalo(self, ctx:visualgParser.Lista_de_intervaloContext):
        pass

    # Exit a parse tree produced by visualgParser#lista_de_intervalo.
    def exitLista_de_intervalo(self, ctx:visualgParser.Lista_de_intervaloContext):
        pass


    # Enter a parse tree produced by visualgParser#tipo_da_variavel.
    def enterTipo_da_variavel(self, ctx:visualgParser.Tipo_da_variavelContext):
        pass

    # Exit a parse tree produced by visualgParser#tipo_da_variavel.
    def exitTipo_da_variavel(self, ctx:visualgParser.Tipo_da_variavelContext):
        pass


    # Enter a parse tree produced by visualgParser#tipo_vetor.
    def enterTipo_vetor(self, ctx:visualgParser.Tipo_vetorContext):
        pass

    # Exit a parse tree produced by visualgParser#tipo_vetor.
    def exitTipo_vetor(self, ctx:visualgParser.Tipo_vetorContext):
        pass


    # Enter a parse tree produced by visualgParser#intervalo.
    def enterIntervalo(self, ctx:visualgParser.IntervaloContext):
        pass

    # Exit a parse tree produced by visualgParser#intervalo.
    def exitIntervalo(self, ctx:visualgParser.IntervaloContext):
        pass


    # Enter a parse tree produced by visualgParser#print_variavel.
    def enterPrint_variavel(self, ctx:visualgParser.Print_variavelContext):
        pass

    # Exit a parse tree produced by visualgParser#print_variavel.
    def exitPrint_variavel(self, ctx:visualgParser.Print_variavelContext):
        pass


    # Enter a parse tree produced by visualgParser#calculo.
    def enterCalculo(self, ctx:visualgParser.CalculoContext):
        pass

    # Exit a parse tree produced by visualgParser#calculo.
    def exitCalculo(self, ctx:visualgParser.CalculoContext):
        pass


    # Enter a parse tree produced by visualgParser#expressao_aritmetica.
    def enterExpressao_aritmetica(self, ctx:visualgParser.Expressao_aritmeticaContext):
        pass

    # Exit a parse tree produced by visualgParser#expressao_aritmetica.
    def exitExpressao_aritmetica(self, ctx:visualgParser.Expressao_aritmeticaContext):
        pass


    # Enter a parse tree produced by visualgParser#expressao_logica.
    def enterExpressao_logica(self, ctx:visualgParser.Expressao_logicaContext):
        pass

    # Exit a parse tree produced by visualgParser#expressao_logica.
    def exitExpressao_logica(self, ctx:visualgParser.Expressao_logicaContext):
        pass


    # Enter a parse tree produced by visualgParser#selecao_aritmetica.
    def enterSelecao_aritmetica(self, ctx:visualgParser.Selecao_aritmeticaContext):
        pass

    # Exit a parse tree produced by visualgParser#selecao_aritmetica.
    def exitSelecao_aritmetica(self, ctx:visualgParser.Selecao_aritmeticaContext):
        pass


    # Enter a parse tree produced by visualgParser#selecao_logica.
    def enterSelecao_logica(self, ctx:visualgParser.Selecao_logicaContext):
        pass

    # Exit a parse tree produced by visualgParser#selecao_logica.
    def exitSelecao_logica(self, ctx:visualgParser.Selecao_logicaContext):
        pass


    # Enter a parse tree produced by visualgParser#selecao_escolha.
    def enterSelecao_escolha(self, ctx:visualgParser.Selecao_escolhaContext):
        pass

    # Exit a parse tree produced by visualgParser#selecao_escolha.
    def exitSelecao_escolha(self, ctx:visualgParser.Selecao_escolhaContext):
        pass


    # Enter a parse tree produced by visualgParser#incremento.
    def enterIncremento(self, ctx:visualgParser.IncrementoContext):
        pass

    # Exit a parse tree produced by visualgParser#incremento.
    def exitIncremento(self, ctx:visualgParser.IncrementoContext):
        pass



del visualgParser