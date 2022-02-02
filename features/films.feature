#language: pt

Funcionalidade: Filmes
  Sendo um usuário do sistema
  Quero realizar as requisições na API
  Para visualizar as informações dos filmes

  #Validar o formato do request (json válido);
  Cenário: Visualizar filmes
    Dado o endereço da API para manter a visualização de Filmes
    Quando realizar uma requisição passando o formato de visualizção válido
    Então a API irá retornar os filmes no formato Json

  #Validar retornos para URLs inválidas;
  Cenário: Formato inválido
    Dado o endereço da API para manter a visualização de Filmes
    Quando realizar uma requisição passando o formato de visualizção inválido
    Então a API irá retornar uma mensagem de erro com o código de status 404

  Cenário: Filme válido
    Dado o endereço da API para manter a visualização de Filmes
    Quando realizar uma requisição passando o filme 6
    Então a API irá retornar as informações de um filme junto com o código de status 200

  #Validar se o filme 10 é válido e qual o tipo de retorno ao consultar;
  Cenário: Filme inválido
    Dado o endereço da API para manter a visualização de Filmes
    Quando realizar uma requisição passando o filme 10
    Então a API irá retornar uma mensagem de erro junto com o código de status 404

  #Validar o nome correto de um determinado episódio de filme;
  Cenário: Nome correto
    Dado o endereço da API para manter a visualização de Filmes
    Quando realizar uma requisição passando o filme 6
    Então a API irá retornar os dados do filme "Revenge of the Sith"
