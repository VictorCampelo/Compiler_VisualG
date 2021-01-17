algoritmo "Desvio condicional composto"
// Função: Demonstrar a utilização do desvio condicional composto.
// Autor: VICTOR CAMPELO
// Data: 22/12/2020
// Seção de Declarações
 
 //VAR GLOBAIS
var a: inteiro
Valor1, Valor2, media: real
vet: vetor [1..10] de real
matriz: vetor [0..4,8..10] de inteiro
nome_do_aluno: caractere
sinalizador: logico

//constantes
a <- 3
Valor1 <- 1.5
Valor2 <- Valor1 + a
vet[1] <- vet[1] + (a * 3)
matriz[3,9] <- a/4 - 5
nome_do_aluno <- "Jose da Silva"
sinalizador <- FALSO

funcao decrementa(x: inteiro): inteiro
var
  
inicio
      x <- x - 1
      retorne x
fimfuncao

procedimento soma(x,y: inteiro)
   var aux: inteiro
   inicio
      media <- x + y
fimprocedimento

inicio
// Seção de Comandos
x <- 2.5
y <- 6
a <- "teste"
l <- VERDADEIRO

escreva ("x", x:4:1, y+3:4) // Escreve: x 2.5 9
escreva (a, "ok") // Escreve: testeok (e depois pula linha)
escreva (a, " ok") // Escreve: teste ok (e depois pula linha)
escreva (a + " ok") // Escreve: teste ok (e depois pula linha)
escreva (l) // Escreve: VERDADEIRO

escreva ("Informe o nome do aluno: ")
leia (nome)
escreva ("Informe a nota da P1: ")
leia (nota1)
escreva ("Informe a nota da P2: ")
leia (nota2)
 
media <- soma(nota1 + nota2) / 2
 
se  media >= 7 entao
  escreva("Sua media e: ", media)
fimse

enquanto j <= 10 faca
  decrementa(j)
fimenquanto

para j de 10 ate 1 passo -1 faca

fimpara
 
fimalgoritmo