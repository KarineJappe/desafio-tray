Dado("o endereço da API para manter a visualização de pessoa") do
  $uri_base = "http://swapi.dev/api/people/"
end

Quando("realizar uma requisição passando o protocolo HTTP") do
  $response = HTTParty.get($uri_base)
end

Então("a API irá retornar as informações da pessoa") do
  #valida que a requisição é bem sucedida com o protocolo HTTP
  expect($response).to be_success
end
