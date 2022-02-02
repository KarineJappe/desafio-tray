Dado("o endereço da API para manter a visualização de Filmes") do
  $uri_base = "https://swapi.dev/api/films/"
end

Quando("realizar uma requisição passando o formato de visualizção válido") do
  $response = HTTParty.get("#{$uri_base}?format=json")
end

Então("a API irá retornar os filmes no formato Json") do
  #valida que o formato retornado é JSON
  expect($response.code).to eql(200)
  expect {
    JSON.parse($response.body)
  }.to_not raise_error
end

Quando("realizar uma requisição passando o formato de visualizção inválido") do
  $response = HTTParty.get("#{$uri_base}?format=jsonx")
end

Então("a API irá retornar uma mensagem de erro com o código de status {int}") do |status_code|
  #valida status code e mensagem de retorno
  expect($response.code).to eql(status_code)
  expect($response["detail"]).to eql("Not found")
end

Quando("realizar uma requisição passando o filme {int}") do |int|
  $response = HTTParty.get("#{$uri_base}#{int}")
end

Então("a API irá retornar as informações de um filme junto com o código de status {int}") do |status_code|
  #valida o status code
  expect($response.code).to eql(status_code)
end

Então("a API irá retornar uma mensagem de erro junto com o código de status {int}") do |int|
  #valida status code e mensagem de retorno
  expect($response.code).to eql(int)
  expect($response["detail"]).to eql("Not found")
end
