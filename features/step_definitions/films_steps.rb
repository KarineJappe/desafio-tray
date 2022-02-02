Dado("o endereço da API para manter a visualização de Filmes") do
  $uri_base = "https://swapi.dev/api/films/"
end

Quando("realizar uma requisição passando o formato de visualizção válido") do
  $response = HTTParty.get("#{$uri_base}?format=json")
end

Então("a API irá retornar os filmes no formato Json") do
  expect($response.code).to eql(200)
  expect {
    JSON.parse($response.body)
  }.to_not raise_error
end

Quando("realizar uma requisição passando o formato de visualizção inválido") do
  $response = HTTParty.get("#{$uri_base}?format=jsonx")
end

Então("a API irá retornar uma mensgem de erro com o código {int}") do |status_code|
  expect($response.code).to eql(status_code)
  expect($response["detail"]).to eql("Not found")
end

Quando("realizar uma requisição passando o filme {int}") do |int|
  $response = HTTParty.get("#{$uri_base}#{int}")
end

Então("a API irá retornar as informações de um filme") do
  expect($response.code).to eql(200)
end

Então("a API irá retornar uma mensgem de erro junto com o código {int}") do |int|
  expect($response.code).to eql(int)
  expect($response["detail"]).to eql("Not found")
end
