# SWAPI

 Projeto desenvolvido em `ruby` utilizando `cucumber`, `HTTParty` e `rspec`. Realiza testes de API utilizando a api públlica [SWAPI](https://swapi.dev/documentation).

  >Para rodar esta projeto é necessário seguir os passos abaixo, partindo do pressuposto que tenha o ruby instalado em sua máquina na versão [2.7.5](https://ruby-doc.org/stdlib-2.7.5/).

## Bundler

Instale o Bundler:

```bash
$ gem install bundler
```

## Projeto

>Faça o Clone do projeto
>Execute o comando  para instalar as dependências

```bash
$ bundle install
```

>Rode o projeto usando o comando

```bash
$ cucumber
```

### Abaixo está as validações realizadas, dividias em dois arquivos de Features.

```bash
features/films.feature
features/people.feature
```

- [x] 1. Validar o formato do request (json válido) para a seguinte API:  <https://swapi.dev/api/films/?format=json>

- [x] 2. Validar se o retorno HTTP é válido para um GET;

- [x] 3. Validar retornos para URLs inválidas, como por exemplo: <https://swapi.dev/api/films/?format=jsonx>

- [x] 4. Validar se o filme 10 é válido e qual o tipo de retorno ao consultar;

- [x] 5. Validar o nome correto de um determinado episódio de filme;

- [x] 6. Validar o ID do episódio e o tipo do dado está correto;

- [x] 7. Validar o formato de data válida (padrão americano YYYY-MM-DD) e validar se a data não é padrão Brasil;

- [x] 8. Validar o peso e altura do “people” C-3PO e validar pelo menos um filme que  ele tenha participado.
