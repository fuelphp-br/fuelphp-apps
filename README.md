# Criando aplicativos com o framework fuelPHP

Criando aplicativos com o framework fuelPHP usando a ferramenta oil.

## Veja o tutorial sobre configurações antes:
https://github.com/fuelphp-br/fuelphp-config


## Criar um aplicativo chamado cadastro, com autenticação

cd /var/www/html
oil create cadastro

## Criando o aplicativo com o oil para criar controller, model e migration

### Criar model e sua migration
oil g model cliente nome:varchar[50] email:varchar[50] idade:int

Criou o model com nome de arquivo fuel/app/classes/model/cliente.php e classe Model_Cliente

### Criar controller e suas views
oil g controller cliente index add edit delete

Criou o controller com nome de arquivo fuel/app/classes/controller/cliente.php e classe Controller_Cliente

Criou a pasta cliente de views em fuel/app/views, contendo as views que pedi para que o controller criasse: add, edit, delete e index

## Configurar ORM e Auth (ver configurações)

## Efetuar o migrate para criar a tabela
oil refine migrate

O migration cria uma tabela com nome no plural e minúsculas: clientes. Veja as tabelas criadas no banco: clientes e migration
Criou a migration fuel/app/migrations/001_create_clientes.php

Ao criar com oil um controller, ele cria o controller e a view respectiva

Ao criar um model ele cria o model e a migrations correspondente em fuel/app/migrations

Dependendo do seu ambiente precisará ajustar as permissões do diretório onde está o app para que o dono seja o Apache

Chamar pelo navegador

http://localhost/cadastro/public/cliente

## Podemos configurar o router para que seja aberta a view cliente e não wellcome:

Mudar de 	'_root_' => 'welcome/index',

Para 	'_root_' => 'welcome/index',

http://localhost/cadastro/public

Assim ele já abre cliente. Veja que existem os 4 links para as 4 views, mas praticamente sem conteúdo. Veja que ele usa o twitter bootstrap nas views

Na próxima parte deste tutorial criaremos um aplicativo usando o scaffold que gera um aplicativo útil com os campos da tabela e com views completas.

## Criar o aplicativo com o oil criando com scaffold um crud usável

Agora criaremos a tabela vendedors (é assim que ele entende o plural de vendedor)

## Gerar o CRUD com scaffold
oil g scaffold vendedor nome:string email:string cpf:string

Veja o que ele cria
```php
	Creating migration: /backup/www/fuel/cadcli/fuel/app/migrations/002_create_vendedors.php
	Creating model: /backup/www/fuel/cadcli/fuel/app/classes/model/vendedor.php
	Creating controller: /backup/www/fuel/cadcli/fuel/app/classes/controller/vendedor.php
	Creating view: /backup/www/fuel/cadcli/fuel/app/views/vendedor/index.php
	Creating view: /backup/www/fuel/cadcli/fuel/app/views/vendedor/view.php
	Creating view: /backup/www/fuel/cadcli/fuel/app/views/vendedor/create.php
	Creating view: /backup/www/fuel/cadcli/fuel/app/views/vendedor/edit.php
	Creating view: /backup/www/fuel/cadcli/fuel/app/views/vendedor/_form.php
```

## Gerar a migrate
oil refine migrate

Verifique no banco

Chamar
http://localhost/cadastro/public/vendedor

Veja que agora temos um botão para adicionar um vendedor que abre um formulário.

Observe que podemos listar, adicionar, editar, excluir e com solicitação de confirmação. Um CRUD completo.

Com o scaffold fica bem mais prático.

## Criação de aplicativo com alguns CRUDs protegidos por um login

Criaremos primeiro o admin com cliente e depois com vendedor assim:

### Scaffolding admin para cliente
oil g admin cliente nome:string[50] email:string[50] idade:int -s

### Scaffolding admin para vendedor
oil g admin vendedor nome:string[50] email:string[50] cpf:string[12] -s

### Efetuar migrade de ambas as tabelas
oil refine migrate

## Agora iremos criar a estrutura de autenticação

### Após mudar o driver para Ormauth para criar as tabelas de autenticação com dados:
oil refine migrate --packages=auth

O que fez?
```php
Performed migrations for package:auth:
001_auth_create_usertables
002_auth_create_grouptables
003_auth_create_roletables
004_auth_create_permissiontables
005_auth_create_authdefaults
006_auth_add_authactions
007_auth_add_permissionsfilter
008_auth_create_providers
009_auth_create_oauth2tables
010_auth_fix_jointables
011_auth_group_optional
```
Veja as tabelas criadas.

### Teremos no admin um painel de controle com menu:
Cadastro de Clientes Início Cliente Vendedor

Acessemos
http://localhost/cadastro/public/admin

Entre com
admin
admin

### Idealmente mudemos o router para
admin/login

### Assim ao acessar
http://localhost/cadastro/public/

Já cairá na tela de login

### Para traduzir os termos precisamos editar alguns arquivos:
- fuel/app/views/admin/dashboard.php (boa parte do texto da tela inicial)
- fuel/app/views/admin/template.php (My Site, Dashboard, Logout e outros)
- fuel/app/classes/controller/admin.php (Dashboard no action_index e outros)

Boa diversão. Ops, boa programação! :)

## Tela Final

Veja como ficou meu aplicativo ao final
![Aplicativo com Fuel](hhttps://github.com/fuelphp-br/fuelphp-apps/blob/master/fueloriginal.png "Aplicativo com o Fuel")


## Testando o aplicativo cadastro

Para testar o aplicativo criado quando elaborava este tutorial apenas faça o download deste repositório e siga as instruções aqui

[Testar](https://github.com/fuelphp-br/fuelphp-apps/blob/master/TESTAR.md)
