# Progresso (25/10/2026)

Legenda: ✅ implementado e testado · 🟡 implementado, não testado de ponta a ponta · 🟠 parcial · ⬜ não implementado · 🔧 depende de configuração externa

| Requisito | Estado | Notas |
|---|---|---|
| Esquema SQL + migrações versionadas | ✅/🟡 | Aplicado ao projeto dev e testado por SQL. Os ficheiros em `supabase/migrations` **não foram reexecutados num projeto limpo** (ver Riscos). |
| RLS e isolamento multiempresa | ✅ | `tests/security/rls_isolation.sql` (corrido no dev, reverte tudo). |
| Numeração atómica, totais no servidor | ✅ | `issue_document` |
| Pagamentos parciais, idempotência, recibos | ✅ | `record_payment` |
| Reversão de pagamentos e cancelamento com motivo | ✅ | `reverse_payment`, `cancel_document` |
| Despesas + recorrentes sem duplicar | ✅ | `generate_recurring_expenses` |
| Planos/limites no backend, ativação manual | ✅ | triggers + `admin_set_subscription` |
| Convites/remoção de membros | ✅ | |
| Dashboard (faturado ≠ recebido ≠ despesas) | ✅ | `dashboard_summary` |
| Cálculos, estados, CSV, fila offline | ✅ | 24 testes unitários (Vitest) |
| Frontend (todas as páginas) | 🟡 | compila, build OK; **nunca aberto num navegador contra o Supabase real nesta sessão** |
| Auth (registo, confirmação, recuperação) | 🟡/🔧 | UI feita; URLs de redirecionamento e SMTP por configurar no Supabase |
| PDF de documentos | 🟡 | gerado com jsPDF; sem inspeção visual |
| Importação CSV com pré-validação | ✅(lógica)/🟡(UI) | |
| Exportação CSV/PDF/JSON | 🟡 | |
| Exportação Excel .xlsx | ⬜ | usar CSV (abre no Excel). Pendente por segurança/peso da biblioteca |
| PWA instalável + cache de recursos | 🟡 | service worker gerado; não testado em dispositivo |
| Offline: fila persistente, sync, idempotência | ✅(motor)/🟡(integração) | |
| Offline: numeração só no servidor | ✅ | offline só guarda rascunho/pendente |
| Painel administrativo da plataforma (UI) | ⬜ | só a RPC `admin_set_subscription` |
| Supabase Storage (logótipos/comprovativos) | ⬜ | |
| Personalização de PDF (cores/logótipo/modelos) | ⬜ | |
| Autenticação 2 fatores | ⬜ | opcional |
| Testes E2E, de integração HTTP | ⬜ | sandbox sem acesso a supabase.co |
| Deploy Cloudflare | 🔧 | `wrangler.jsonc` pronto; ver `docs/DEPLOYMENT.md` |
| Repositório GitHub | 🔧 | `publicar-github.bat` |

## v2 (design) 03/11/2026
- ✅ Tema escuro, Montserrat, logótipo, login dividido, menu agrupado, indicadores com sublinhado, PDF no estilo da fatura de referência.
- ✅ Páginas novas: Configuração (dados do PDF) e Auditoria. Migração 007 aplicada ao projeto dev.
- ✅ Testado em Chromium com Supabase **simulado** (sem erros de página; PDF gerado e inspecionado). Não testado contra o Supabase real.
- 🟠 Não migrado do projeto antigo: página "Sobre a Criativos", QR code da fatura, impressão pelo navegador (agora PDF direto).
- 🟠 Telemóvel: layout adaptado (menu horizontal) mas só verificado por captura simulada.
