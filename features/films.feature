#language: pt

Funcionalidade: Filmes
  Sendo um usuário do sistema
  Quero realizar as requisições na API
  Para visualizar as informações dos filmes

  #Validar o formato do request (json válido)
  Cenário: Visualizar filmes
    Dado o endereço da API para manter o cadastro de Filmes
    Quando realizar uma requisição passando o formato de visualizção válido
    Então a API irá retornar os filmes no formato Json

  #Validar retornos para URLs inválidas
  Cenário: Formato inválido
    Dado o endereço da API para manter o cadastro de Filmes
    Quando realizar uma requisição passando o formato de visualizção inválido
    Então a API irá retornar uma mensgem de erro com o código 404
