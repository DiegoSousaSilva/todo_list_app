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
* Firebase Authentication
* SQLite (sqflite)
* Provider
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
│  │  │  ├─ validators
│  │  │  │  └─ validators.dart
│  │  │  └─ widget
│  │  │     ├─ todo_list_field.dart
│  │  │     └─ todo_list_logo.dart
│  │  ├─ exceptions
│  │  │  └─ auth_exception.dart
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
│  │  │  └─ user
│  │  │     ├─ user_repository.dart
│  │  │     └─ user_repository_impl.dart
│  │  └─ services
│  │     └─ user
│  │        ├─ user_service.dart
│  │        └─ user_service_impl.dart
│  ├─ firebase_options.dart
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
* [x] Configuração do Firebase
* [x] Tema global da aplicação
* [x] Splash Screen
* [x] Tela de Login
* [x] Tela de Cadastro
* [x] Campo de formulário reutilizável
* [x] Componentes visuais compartilhados
* [x] Estrutura de Repository Pattern
* [x] Estrutura de Service Layer
* [x] Cadastro de usuários com Firebase Authentication
* [x] Validação de formulários
* [x] Tratamento de exceções de autenticação

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


## Arquitetura Aplicada

O projeto segue uma arquitetura modular baseada em separação de responsabilidades.

### Presentation Layer

Responsável pela interface do usuário.

Exemplos:

* LoginPage
* RegisterPage
* SplashPage
* Controllers

### Service Layer

Contém as regras de negócio da aplicação.

Exemplos:

* UserService
* UserServiceImpl

### Repository Layer

Responsável pela comunicação com fontes de dados externas.

Exemplos:

* UserRepository
* UserRepositoryImpl

### Data Sources

Atualmente:

* Firebase Authentication
* SQLite

### Modularização (Feature First)

Cada funcionalidade da aplicação é organizada em módulos independentes.

Módulos atuais:

* Auth
* Splash
* Todo List


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

🚧 Em desenvolvimento

Atualmente o projeto já possui:

- Estrutura modular
- Banco SQLite configurado
- Firebase integrado
- Cadastro de usuários funcional
- Camadas Repository e Service implementadas

Próxima etapa: conclusão do fluxo de autenticação e desenvolvimento do módulo de tarefas.

## Autor

Diego Sousa

