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

Então("a API irá retornar os dados do filme {string}") do |episode_title|
  #valida o título do epsódio
  expect($response["title"]).to eql(episode_title)
end

Então("a API irá retornar o id do episódio {int}") do |episode_id|
  #valida id do epsodio e o tipo int
  expect($response["episode_id"]).to be_a_kind_of(Integer)
  expect($response["episode_id"]).to eql(episode_id)
end

Então("a API irá retornar uma data de lançamento no padrão americano") do
  def valid_date(date, format)
    Date.parse(date).strftime(format) == date
  end

  #valida a data no padrão americano
  expect(valid_date($response["release_date"], "%Y-%m-%d")).to be_truthy

  # As duas linhas abaixo realizam a validação que a data não é padrão brasileiro.
  # expect(valid_date($response["release_date"], "%d-%m-%Y")).to be_falsy
  expect($response["release_date"]).not_to match(/(\d{2})[-.\/](\d{2})[-.\/](\d{4})/)
end
