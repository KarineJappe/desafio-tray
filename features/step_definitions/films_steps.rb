Dado("o endereço da API para manter o cadastro de Filmes") do
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
