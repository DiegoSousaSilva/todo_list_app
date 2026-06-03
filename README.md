# Todo List App

Aplicativo de gerenciamento de tarefas desenvolvido em Flutter com foco em aprendizado, organização de código e aplicação de boas práticas de desenvolvimento mobile.

## Objetivo

O projeto tem como objetivo praticar conceitos fundamentais do Flutter, incluindo:

* Estruturação de projetos
* Navegação entre telas
* Gerenciamento de estado
* Persistência local de dados
* Organização em camadas
* Versionamento com Git

## Tecnologias

* Flutter
* Dart
* Provider
* SQLite (sqflite)
* Google Fonts
* Sign In Button
* Path


## Estrutura Atual do Projeto

```
├─ assets
│  └─ images
│     └─ logo.png
├─ lib
│  ├─ app
│  │  ├─ app_module.dart
│  │  ├─ app_widget.dart
│  │  ├─ core
│  │  │  ├─ database
│  │  │  │  ├─ migrations
│  │  │  │  │  ├─ migration.dart
│  │  │  │  │  ├─ migration_v1.dart
│  │  │  │  │  └─ migration_v2.dart
│  │  │  │  ├─ sqlite_adm_connection.dart
│  │  │  │  ├─ sqlite_connection_factory.dart
│  │  │  │  └─ sqlite_migration_factory.dart
│  │  │  ├─ modules
│  │  │  │  ├─ todo_list_module.dart
│  │  │  │  └─ todo_list_page.dart
│  │  │  ├─ ui
│  │  │  │  ├─ theme_extensions.dart
│  │  │  │  └─ todo_list_ui_config.dart
│  │  │  └─ widget
│  │  │     ├─ todo_list_field.dart
│  │  │     └─ todo_list_logo.dart
│  │  ├─ models
│  │  ├─ modules
│  │  │  ├─ auth
│  │  │  │  ├─ auth_module.dart
│  │  │  │  ├─ login
│  │  │  │  │  ├─ login_controller.dart
│  │  │  │  │  └─ login_page.dart
│  │  │  │  └─ register
│  │  │  │     ├─ register_controller.dart
│  │  │  │     └─ register_page.dart
│  │  │  └─ splash
│  │  │     └─ splash_page.dart
│  │  ├─ repositories
│  │  └─ services
│  └─ main.dart

``` 

## Organização das Pastas

### core/

Contém recursos compartilhados por toda a aplicação:

* Configuração do banco de dados SQLite
* Migrations
* Temas e estilização
* Widgets reutilizáveis
* Configurações globais

### modules/

Organização baseada em funcionalidades (Feature First).

Cada módulo concentra suas telas, controladores e responsabilidades relacionadas a uma funcionalidade específica da aplicação.

#### Auth Module

Responsável pelo fluxo de autenticação do usuário.

Atualmente contém:

* Login Page
* Register Page
* Controllers de Login e Cadastro

#### Splash Module

Tela inicial responsável pelo carregamento da aplicação e inicialização dos recursos necessários.

#### Todo List Module

Módulo principal da aplicação.

Será responsável por:

* Cadastro de tarefas
* Edição de tarefas
* Exclusão de tarefas
* Controle de tarefas concluídas
* Filtros e produtividade


### models/

Contém as entidades e modelos de dados da aplicação.

### repositories/

Responsável pelo acesso e persistência dos dados.

### services/

Contém serviços utilizados pela aplicação, como autenticação, banco de dados e integrações externas.



## Funcionalidades

### Concluído

* [x] Estrutura modular da aplicação
* [x] Configuração do SQLite
* [x] Sistema de Migrations
* [x] Gerenciamento do ciclo de vida do banco
* [x] Tema global da aplicação
* [x] Splash Screen
* [x] Tela de Login
* [x] Campo de formulário reutilizável
* [x] Componentes visuais compartilhados
* [x] Tela de Cadastro



### Próximas Implementações

* [ ] Autenticação
* [ ] Cadastro de tarefas
* [ ] Edição de tarefas
* [ ] Exclusão de tarefas
* [ ] Marcação de tarefas concluídas
* [ ] Persistência local de tarefas
* [ ] Filtro de tarefas
* [ ] Tema escuro
* [ ] Estatísticas de produtividade


## Como Executar

Instalar dependências:

```bash
flutter pub get
```

Executar o projeto:

```bash
flutter run
```

## Status

🚧 Em desenvolvimento.

Projeto criado como laboratório de aprendizado para evolução em Flutter e desenvolvimento mobile.

## Autor

Diego Sousa

