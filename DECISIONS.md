# Decisões

1. **Cloudflare Workers (static assets) em vez de Pages.** Documentação atual da Cloudflare recomenda Workers para projetos novos. `not_found_handling: single-page-application`. Sem Worker script.
2. **Sem backend próprio.** Lógica financeira sensível em funções Postgres (`SECURITY DEFINER`, `search_path=''`) com verificação de papel dentro de cada função. Edge Functions só se surgir necessidade (ex.: verificação de pagamentos externos).
3. **Funções de permissão em schema `private`**, não exposto pela API; evita recursão de RLS.
4. **Escrita financeira só por RPC.** Documentos emitidos, pagamentos e sequências não têm políticas de escrita para o cliente.
5. **Dinheiro:** `numeric(14,2)` na BD; `BigInt` no cliente. Arredondamento meio-para-cima **por linha**, igual no cliente e no servidor.
6. **Offline:** fila (Dexie) com chave de idempotência = id da operação. Conflitos financeiros nunca resolvidos por "última escrita vence": ficam em estado *conflito/rejeitado*. Numeração definitiva só no servidor.
7. **Região Supabase:** `eu-west-2` (sem região africana; Londres/Paris costumam dar melhor latência para Luanda).
8. **Cache offline:** só clientes e catálogo. Nunca cache de pedidos à API (dados financeiros vêm sempre do servidor).
9. **Excel .xlsx adiado**; CSV com BOM UTF-8 e separador `;` (abre bem no Excel pt) e mitigação de injeção de fórmulas.
10. **Planos:** valores de exemplo em tabela `plans` (editáveis); preço do plano pago por definir.
11. **Taxas de imposto:** configuradas por linha pelo utilizador; nenhum valor fiscal angolano embutido.
