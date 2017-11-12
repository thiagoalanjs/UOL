#language : pt
#utf-8

Funcionalidade: Verificar cotação do dolar
Eu como cliente
Quero realizar uma busca do UOL pelo buscador
Para saber a cotação do dolar

Cenario: Validar valor do dolar

Dado que acessei a página do buscador 
E insiro no campo de busca palavra UOL
Quando clico no botão pesquisa
E clico no primeiro resultado
E clico no link economia 
Então comparo se o valor do dólar é menor que R$ 3.20