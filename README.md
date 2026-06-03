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

## Estrutura Atual do Projeto

```
lib
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
│  │  │  └─ modules
│  │  │     ├─ todo_list_module.dart
│  │  │     └─ todo_list_page.dart
│  │  ├─ models
│  │  ├─ modules
│  │  │  ├─ auth
│  │  │  │  ├─ auth_module.dart
│  │  │  │  └─ login
│  │  │  │     ├─ login_controller.dart
│  │  │  │     └─ login_page.dart
│  │  │  └─ splash
│  │  │     └─ splash_page.dart
│  │  ├─ repositories
│  │  └─ services
│  └─ main.dart

``` 

## Organização das Pastas

### core/

Responsável por componentes compartilhados, constantes, utilitários e recursos globais da aplicação.

### models/

Contém as entidades e modelos de dados utilizados pela aplicação.

### repositories/

Responsável pela camada de acesso aos dados, abstraindo a origem das informações.

### services/

Contém serviços da aplicação, como banco de dados local, APIs e outras integrações.

### modules/

Organização baseada em funcionalidades da aplicação.

Atualmente:

* Splash Module

Novos módulos serão adicionados conforme o crescimento do projeto.

## Funcionalidades Planejadas

* [ ] Cadastro de tarefas
* [ ] Edição de tarefas
* [ ] Exclusão de tarefas
* [ ] Marcação de tarefas concluídas
* [ ] Persistência local com SQLite
* [ ] Gerenciamento de estado com Provider
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


