# Gestão Comercial Desktop

Sistema de gestão comercial desktop desenvolvido em **Delphi VCL** com **SQL Server**, criado como projeto de portfólio para demonstrar organização de código, acesso a dados, autenticação e operações CRUD.

## Funcionalidades

- Autenticação de usuários
- Validação de senha por hash SHA-256
- Navegação por menu lateral
- Cadastro e edição de usuários
- Ativação e inativação de usuários
- Cadastro e edição de clientes
- Ativação e inativação de clientes
- Listagens em `TDBGrid`
- Atualização automática das listagens após cadastro ou edição
- Configuração externa de conexão por arquivo `.ini`

## Tecnologias

- Delphi 13 Community Edition
- VCL
- SQL Server
- ADO / dbGo
- Microsoft OLE DB Driver for SQL Server
- Git / GitHub

## Estrutura do projeto

```text
gestao-comercial-delphi/
├── config/
│   ├── config.ini
│   └── config.example.ini
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_create_cliente.sql
│   └── 04_seed_data.sql
├── docs/
├── src/
│   ├── DataModules/
│   ├── Forms/
│   ├── Repositories/
│   └── Utils/
├── .gitignore
└── README.md
```

## Arquitetura

O projeto separa as responsabilidades principais em camadas simples:

- **Forms**: interface e interação com o usuário.
- **DataModules**: conexão compartilhada com o banco de dados.
- **Repositories**: consultas, inserts e updates.
- **Utils**: funções auxiliares reutilizáveis.
- **Database**: scripts para criação e carga inicial do banco.

Fluxo simplificado:

```text
Form
  ↓
Repository
  ↓
ADO
  ↓
SQL Server
```

## Banco de dados

Banco utilizado:

```text
PORTFOLIO_GESTAO
```

Execute os scripts da pasta `database` na ordem:

```text
01_create_database.sql
02_create_tables.sql
03_create_cliente.sql
04_seed_data.sql
```

O script `04_seed_data.sql` cria um usuário administrador para demonstração caso ele ainda não exista.

## Configuração da conexão

Crie o arquivo:

```text
config/config.ini
```

Use como base:

```ini
[DATABASE]
Server=SEU_SERVIDOR
Database=PORTFOLIO_GESTAO
```

O arquivo `config.ini` não deve ser versionado. O repositório pode manter apenas o `config.example.ini`.

## Usuário de demonstração

Após executar o script de carga inicial:

```text
Login: admin
Senha: 123456
```

Essas credenciais existem somente para facilitar a execução local do projeto de portfólio.

## Como executar

1. Instale o SQL Server.
2. Instale o Microsoft OLE DB Driver for SQL Server.
3. Execute os scripts da pasta `database`.
4. Configure o arquivo `config/config.ini`.
5. Abra o projeto no Delphi.
6. Compile e execute com `F9`.
7. Entre com o usuário de demonstração.

## Módulos implementados

### Usuários

- Consulta
- Cadastro
- Edição
- Ativação/inativação
- Senha armazenada como hash
- Grid somente para consulta/seleção

### Clientes

- Consulta
- Cadastro
- Edição
- Ativação/inativação
- Nome, documento, e-mail e telefone
- Grid somente para consulta/seleção

## Objetivo do projeto

Este projeto foi desenvolvido como um primeiro portfólio em Delphi, com foco em demonstrar fundamentos de aplicações desktop, integração com SQL Server, organização em camadas e versionamento com Git.

O escopo foi mantido propositalmente enxuto para priorizar código organizado e funcionalidades concluídas.

## Possíveis evoluções

- Alteração de senha em fluxo separado
- Máscaras e validações de CPF/CNPJ e telefone
- Dashboard
- Produtos
- Pedidos
- Perfis e permissões de acesso
- Relatórios

## Status

**Versão de portfólio concluída.**
