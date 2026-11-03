# dct2201-banco-de-dados

## Tarefa 03: Docker Compose, MariaDB e Administração de SGBD

Arquivos na pasta `tarefa03/`:

| Arquivo | Finalidade |
|---|---|
| `docker-compose.yml` | Sobe o MariaDB 11 e o CloudBeaver, com volume nomeado `mariadb_data` |
| `.env.example` | Modelo das variáveis de ambiente (sem segredos reais) |
| `povoamento.sql` | Carga expandida gerada com IA generativa |
| `setup.sql` | Script idempotente que recria banco, tabelas, usuários, privilégios e dados |

O `.gitignore` (na raiz) impede o versionamento do `.env`.

Uso: `cd tarefa03 && cp .env.example .env && docker compose up -d`
