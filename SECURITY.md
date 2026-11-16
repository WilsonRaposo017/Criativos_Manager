# Segurança

## Implementado
- RLS em todas as tabelas com dados privados; isolamento por empresa testado (`tests/security/rls_isolation.sql`).
- Permissões verificadas no servidor (RLS + papel dentro de cada RPC). A UI só esconde botões.
- Escrita em documentos emitidos/pagamentos/auditoria/sequências bloqueada ao cliente; só por funções.
- Trigger impede documento usar cliente de outra empresa.
- Limites de plano (clientes, utilizadores, documentos/mês) aplicados por triggers.
- Apenas a chave pública (publishable) vai para o navegador; `.env` está no `.gitignore`; CI falha se uma chave secreta aparecer na build.
- Recuperação de palavra-passe com resposta neutra (não revela se o email existe). Palavra-passe mínima de 10 caracteres na UI.
- Exportações CSV mitigam injeção de fórmulas. Importação limitada (2 MB, 2000 linhas) e validada antes de gravar.
- `npm audit --omit=dev`: 0 vulnerabilidades (25/10/2026).

## Limitações / por fazer antes de dados reais
1. Ativar nas definições do Supabase Auth: confirmação de email, política de palavras-passe, proteção contra palavras-passe vazadas, limites de taxa, e **SMTP próprio** (o SMTP por defeito é limitado).
2. Configurar *Site URL* e *Redirect URLs* de produção (sem `localhost`).
3. Criar **projeto Supabase de produção separado** e ativar backups adequados ao plano (o gratuito não inclui backups diários).
4. Nenhum teste de intrusão independente; sem 2FA; sem Storage/anexos (e por isso sem políticas de ficheiros ainda).
5. Auditoria regista emissão, cancelamento, pagamentos, reversões, convites, subscrições e exportações; não regista edições de rascunhos.
6. O gestor de pacotes e as dependências devem ser atualizados regularmente.
7. Painel de administração da plataforma ainda não existe; acesso excecional de suporte a dados de empresas não está implementado (e por desenho não deve ser concedido sem regras e auditoria).

Não reproduza chaves em commits, issues ou mensagens. Se uma chave secreta for exposta: revogue e substitua.
