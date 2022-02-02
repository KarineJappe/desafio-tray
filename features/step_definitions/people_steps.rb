Dado("o endereço da API para manter a visualização de pessoa") do
  def get_uri(is_http)
    if is_http
      $uri_base = "http://swapi.dev/api/people/"
    else
      $uri_base = "https://swapi.dev/api/people/"
    end
  end
end

Quando("realizar uma requisição passando o protocolo HTTP") do
  $response = HTTParty.get(get_uri(true))
end

Então("a API irá retornar as informações da pessoa") do
  #valida que a requisição é bem sucedida com o protocolo HTTP
  expect($response).to be_success
end

Quando("realizar uma requisição a pessoa {int}") do |people_id|
  $response = HTTParty.get("#{get_uri(false)}#{people_id}")
end

Então("a API irá retornar as informações da pessoa junto com o código de status {int}") do |int|
  expect($response.code).to eql(200)

  #valida o peso, altura e os filmes do C-3PO
  expect($response["mass"].to_i).to be_a_kind_of(Integer)
  expect($response["mass"].to_i).to eql(75)

  expect($response["height"].to_i).to be_a_kind_of(Integer)
  expect($response["height"].to_i).to eql(167)

  expect($response["films"]).to have_attributes(size: (be > 0))
end
