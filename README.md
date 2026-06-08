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
  * Login com Email e Senha
  * Recuperação de Senha
  * Login com Google
* SQLite (sqflite)
* Provider
* Google Fonts
* Sign In Button
* Validatorless
* Flutter Overlay Loader
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
│  │  │  ├─ notifier
│  │  │  │  ├─ default_change_notifier.dart
│  │  │  │  └─ default_listener_notifier.dart
│  │  │  ├─ ui
│  │  │  │  ├─ messages.dart
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

Responsável pelo fluxo completo de autenticação do usuário.

Funcionalidades implementadas:

* Cadastro com Email e Senha
* Login com Email e Senha
* Recuperação de Senha
* Login com Google
* Tratamento de erros de autenticação
* Feedback visual de carregamento e mensagens

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
* [x] Tela de Login
* [x] Tela de Cadastro
* [x] Cadastro de usuários com Firebase Authentication
* [x] Login com Email e Senha
* [x] Recuperação de Senha
* [x] Login com Google
* [x] Validação de formulários
* [x] Tratamento de exceções de autenticação
* [x] Sistema global de Loading
* [x] Sistema global de Feedback de Erros
* [x] Sistema global de Feedback de Sucesso
* [x] Notifier Pattern para gerenciamento de estados
* [x] Repository Pattern
* [x] Service Layer

### Próximas Implementações

* [ ] Autenticação com Google
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

### Fluxo de Autenticação

LoginPage/RegisterPage
        ↓
Controllers
        ↓
Services
        ↓
Repositories
        ↓
Firebase Authentication

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

Atualmente a aplicação utiliza:

* Firebase Authentication
  * Cadastro de usuários
  * Login
  * Recuperação de senha
  * Login com Google

* SQLite
  * Persistência local de dados

### Modularização (Feature First)

Cada funcionalidade da aplicação é organizada em módulos independentes.

Módulos atuais:

* Auth
* Splash
* Todo List
  

### State Management

O projeto utiliza ChangeNotifier para gerenciamento de estados das telas.

Foi criada uma estrutura base reutilizável contendo:

* DefaultChangeNotifier
* DefaultListenerNotifier

Permitindo tratamento padronizado de:

* Loading
* Sucesso
* Erros
* Feedback visual ao usuário


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

### Funcionalidades já operacionais

✅ Cadastro de usuários

✅ Login com Email e Senha

✅ Login com Google

✅ Recuperação de Senha

✅ Firebase Authentication integrado

✅ Arquitetura modular

✅ Repository Pattern

✅ Service Layer

✅ Gerenciamento de estado com ChangeNotifier

### Próximas etapas

- Controle de sessão do usuário
- Logout
- Cadastro de tarefas
- Persistência de tarefas
- Filtros
- Estatísticas de produtividade
  

## Autor

Diego Sousa