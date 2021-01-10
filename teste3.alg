algoritmo "EquaçaoDoSegundoGrau"
var
   a, b, c, delta, x1, x2: real

funcao calcula_delta(): real
var
   delta : real
inicio
      delta <- b*b - 4*a*c
      retorne delta
fimfuncao

inicio
      escreva ("Informe o valor de A: ")
      leia (a)
      escreva ("Informe o valor de B: ")
      leia (b)
      escreva ("Informe o valor de C: ")
      leia (c)

      delta <- calcula_delta()
      se ( delta < 0 ) entao
         escreva ("Esta equacao nao possui raizes reais.")
      senao
           se (delta = 0) entao
              x1 <- (-b + RAIZQ(delta)) / (2*a)
              escreva ("Esta equacao possui apenas uma raiz: ", x1)
           senao
                x1 <- (-b + RAIZQ(delta)) / (2*a)
                x2 <- (-b - RAIZQ(delta)) / (2*a)
                escreva ("Esta equacao possui duas raizes: ", x1, " e ", x2)
           fimse
      fimse
fimalgoritmo