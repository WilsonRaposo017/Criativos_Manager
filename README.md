# Criativos Manager (v2: design da marca)

A v2 aplica a identidade do projeto original (tema escuro azul-marinho, Montserrat, logótipo, ecrã de login dividido, PDF no estilo da fatura de referência) sobre o novo sistema com Supabase. Dados bancários e de contacto **não estão no código**: configure-os em *Sistema → Configuração* (ficam na base de dados da empresa).

Plataforma de gestão comercial e financeira (clientes, catálogo, orçamentos, faturas comerciais, recibos, pagamentos, despesas, relatórios) da Criativos Digital Solutions. Multiempresa, PWA com fila offline.

> **Aviso fiscal:** os documentos são de gestão comercial. **Não** são faturas fiscalmente certificadas nem há homologação ou conformidade fiscal angolana garantida.

**Stack:** React + TypeScript + Vite (PWA) · Supabase (Postgres, Auth, RLS) · Dexie/IndexedDB · Cloudflare Workers (static assets).

## Começar no Windows 10/11
1. Instale o Node.js LTS (20 ou superior) e o Git.
2. `instalar.bat` (cria `.env` a partir de `.env.example`).
3. Preencha `.env` (ver `docs/SUPABASE_SETUP.md`).
4. `iniciar.bat` → http://localhost:5173
5. `testar.bat` → tipos + testes + build.

## Primeira conta e empresa
Em `/registar` crie a conta → confirme o email → entre → o ecrã "Criar a sua empresa" torna-o proprietário com o plano gratuito.

## Estado e documentação
`PROGRESS.md` (o que está feito/pendente), `DECISIONS.md`, `SECURITY.md`, `docs/`.
