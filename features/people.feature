  #language: pt

Funcionalidade: Pessoas
  Sendo um usuário do sistema
  Quero realizar as requisições na API
  Para visualizar as informações das Pessoas
  
  #Validar se o retorno HTTP é válido para um GET;
  Cenário: Validar protocolo
    Dado o endereço da API para manter a visualização de pessoa
    Quando realizar uma requisição passando o protocolo HTTP
    Então a API irá retornar as informações da pessoa

 #Validar o peso e altura do “people” C-3PO e validar pelo menos um filme que  ele tenha participado;
  Cenário: Visualizar pessoa
    Dado o endereço da API para manter a visualização de pessoa
    Quando realizar uma requisição a pessoa 2
    Então a API irá retornar as informações da pessoa junto com o código de status 200
