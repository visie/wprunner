
# Executor de WordPress da Visie

Este projeto é uma imagem Docker capaz de executar, com pouco esforço, os projetos WordPress na estrutura padrão da Visie.

-------

Obs: se você vai apenas desenvolver em WordPress, não precisa clonar este repositório, basta seguir o tutorial abaixo, usando a imagem pública do wprunner. Clone este repositório se você quiser fazer alterações no Dockerfile e gerar sua própria imagem.

-------

## Pré-requisitos

Você precisa ter:

* Git e acesso ao projeto
* Docker
* Um editor de código
* Porta 80 liberada (se você estiver rodando Apache, Nginx, Lighttp ou algum outro serviço na porta 80, pare-o)

# Tutorial

Veja como usar essa imagem fazendo um setup conosco. Nosso projeto:

* O código está em git@servidor:caminho/visie2023
* O nome do projeto é visie2023
* Na raiz do projeto há um dump com o nome visie.sql
* O endereço do site, apontado no dump, é http://visie.meus.br

Ajuste os comandos para os locais e nomes do seu projeto.

## 1. Configurando o domínio

O primeiro passo é editar, como root, o arquivo /etc/hosts (ou C:\\Windows\\System32\\Drivers\\etc\\hosts no Windows) e acrescentar a seguinte linha:

```
127.0.0.1 visie.meus.br
```

## 2. Configurando o código:

O primeiro passo é clonar o projeto:

```
git clone git@servidor:caminho/visie2023
```

Em seguida, entre na pasta do projeto:

```
cd visie2023
```

e faça:

```
cp wordpress/wp-config-sample.php wordpress/wp-config-local.php
```

Edite o arquivo wordpress/wp-config-local.php e troque os dados de conexão ao banco de dados por:

```
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress' );
define( 'DB_PASSWORD', 'wordpress' );
define( 'DB_HOST', 'localhost' );
```

## 3. Subindo o container

Agora vamos criar o container docker:

```
docker run -d --name visie2023 -v $(pwd):/var/www/ -p 80:80 elcio/wprunner
```

Depois disso, o container deve estar criado e rodando, com o nome visie2023. Para pará-lo, você pode usar:

```
docker stop visie2023
```

E para iniciá-lo novamente:

```
docker start visie2023
```

## 4. Importando o banco de dados

Agora vamos importar o banco de dados:

```
docker exec -i visie2023 mysql wordpress < visie.sql
```

E pronto, o site já deve estar rodando em http://visie.meus.br.

-------

# Comandos úteis

Para se conectar ao banco de dados, você pode usar:

```
docker exec -it visie2023 mysql wordpress
```

E para um shell do Linux:

```
docker exec -it visie2023 bash
```

## Removendo o container

Se você não for mais trabalhar nesse projeto e quiser liberar espaço, pode remover o container. Para isso, faça:

```
docker container rm -f visie2023
```

