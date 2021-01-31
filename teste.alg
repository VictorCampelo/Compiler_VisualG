algoritmo "Desvio condicional composto"
// Função: Demonstrar a utilização do desvio condicional composto.
// Autor: VICTOR CAMPELO
// Data: 22/12/2020
// Seção de Declarações
 
//VAR GLOBAIS
var a: inteiro
Valor1, Valor2: real
vet: vetor [1..10] de real
matriz: vetor [0..4,8..10] de inteiro
nome_do_aluno: caractere
sinalizador: logico

//constantes
a <- 3
Valor1 <- FALSO
Valor2 <- Valor1 + a + a
Valor3 <- Valor1 \ 5
Valor4 <- Valor1 mod 3
Valor2 <- a ^ 4
vet[1] <- vet[1] / (a * 3)
matriz[3,9] <- a/4 - 5
nome_do_aluno <- "Jose da Silva"
sinalizador <- FALSO

funcao soma: inteiro
    var aux: inteiro
    inicio
    // n, m e res são variáveis globais
    aux <- n + m
    retorne aux
    fimfuncao

funcao soma(x,y: inteiro): inteiro
    inicio
    retorne x + y
    fimfuncao

funcao vazio (x,y: inteiro): void
    inicio
    retorne void
    fimfuncao

inicio
// Seção de Comandos
x <- 2.5
y <- 6
a <- "teste"
l <- VERDADEIRO

escreval ("x", x:4:1, y+3:4) // Escreva: x 2.5 9
escreval (a, "ok") // Escreve: testeok (e depois pula linha)
escreval (a, " ok") // Escreve: teste ok (e depois pula linha)
escreval (a + " ok") // Escreve: teste ok (e depois pula linha)
escreval ("ok" + a) // Escreve: teste ok (e depois pula linha)
escreval ("ok" + "a") // Escreve: teste ok (e depois pula linha)
escreva (l) // Escreve: VERDADEIRO

escreva ("Informe o nome do aluno: ")
leia (nome)
escreva ("Informe a nota da P1: ")
leia (nota1)
escreva ("Informe a nota da P2: ")
leia (nota2)
 
media <- (nota1 - nota2) / 2
 
se  media >= 7 e media <=2  entao
    x <- soma(media, nota1)

fimse

vazio(5,8)
enquanto j <= 10 faca

fimenquanto


para j de 10 ate 1 passo -1 faca

fimpara
 
fimalgoritmo