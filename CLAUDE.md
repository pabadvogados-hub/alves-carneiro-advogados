# Alves Carneiro Advocacia e Consultoria Jurídica - Central de Automacoes

> Escritorio: **Alves Carneiro Advocacia e Consultoria Jurídica** | Advogado responsavel:
> **Dra. Fabiana Silva Alves Carneiro (OAB/RJ 188.762)**
> Sede/foro: **Rio de Janeiro/RJ**.
> Areas: **Previdenciario** (BPC/LOAS, aposentadorias, beneficios por incapacidade,
> pensao por morte, revisoes) e **Militar** (defesa em PAD/Conselho de Disciplina/
> Justificacao, reforma, promocao, pensao militar, Mandado de Seguranca contra ato
> de autoridade militar).
> Contato: dra.fabiana@alvescarneiroadvocaciaeconsultoriajuridica.com | (21) 99485-7337.
> Socia de negocio: Dra. Kenia Helena de Araujo (Silva e Araujo Sociedade de Advogados,
> Patos de Minas/MG) — contrato individualizado, nao misturar dados dos dois escritorios.

## Regra de ouro

**A IA NUNCA protocola.** Toda peca, peticao ou documento gerado pelas automacoes
deste repositorio e SEMPRE para revisao humana da Dra. Fabiana antes de
qualquer protocolo. Nenhum fluxo aqui envia peca direto para o processo. Os 5
agentes juridicos em `agentes_claude/` terminam toda peca marcada **"PRONTA PARA
REVISAO DA DRA. FABIANA"**.

## Estrutura

```
ALVES_CARNEIRO_ADVOGADOS/
├── agentes_claude/       # 2 agentes juridicos prontos (Claude.ai Projects/Skills)
│   ├── carneiro-previdenciario.md   # Previdenciario - base generica, pendente calibracao
│   ├── carneiro-militar.md          # Militar - base generica, pendente calibracao
│   ├── GUIA_INSTALACAO_CLAUDE_AI.md  # Passo a passo p/ instalar como Projects/Skills
│   └── prompt-criar-skill-timbrado.md # Prompt p/ empacotar skill de timbrado
│
├── .claude/agents/       # Mesmos 5 agentes juridicos + pipeline operacional, no
│                         # formato de subagente do Claude Code (auto-carregados)
│
├── INTEGRACOES/          # Modulos compartilhados (todos os squads usam)
│   ├── google_integration.py     # Google Drive/Docs/Sheets
│   ├── advbox_integration.py     # API ADVBOX - SE o escritorio usar (a confirmar)
│   ├── asaas_integration.py      # API Asaas (cobrancas/recebimentos) - se o escritorio usar
│   ├── zapsign_integration.py    # Assinatura digital
│   ├── atendedireito_integration.py # CRM WhatsApp
│   └── legalmail_integration.py  # Integracao GENERICA/opcional (peticionamento
│       eletronico via LegalMail) - so usar apos confirmar com o escritorio
│
├── INTAKE/              # Squad Comercial - Intake e contratacao
│   ├── main.py                # Orquestrador intake
│   ├── llm_processor.py       # Analise juridica do caso (IA)
│   ├── pdf_extractor.py       # Extracao texto + OCR
│   ├── zapsign_integration.py # Assinatura digital
│   └── atendedireito_integration.py # CRM WhatsApp
│
├── FINANCEIRO/          # Squad Financeiro - Fechamento e conciliacao
│   ├── fechamento_mensal.py   # COMANDO UNICO - fechamento completo
│   ├── processar_extrato.py   # Extrato Asaas + comissoes
│   ├── conciliar_financeiro.py # Conciliacao Asaas x ADVBOX
│   ├── conciliar_c6_advbox.py # Conciliacao banco x ADVBOX
│   ├── cobranca_semanal.py    # Cobranca via WhatsApp/Atende Direito
│   └── preencher_resultado.py # Planilha resultado anual
│
├── OPERACIONAL/          # Squad Operacional - Processos, tarefas, pecas
│   ├── main.py                # Comandos operacionais (tarefas/processos/prazos)
│   ├── peticao_processor.py   # Geracao de peticao inicial (IA)
│   ├── gerar_peticao.py       # Baixar docs / subir peticao formatada
│   ├── protocolo_entrega.py   # Protocolo de entrega/recebimento
│   └── agente_operacional/    # Agente CARNEIRO.IA (webhook FastAPI)
│
├── SYNC/                # Sincronizacao de docs assinados (ZapSign -> Drive)
├── DOCS_MODELOS/        # Timbrado + pecas-modelo REAIS do escritorio (vazio - AGUARDANDO)
├── CADASTROS/           # Fichas e dados de clientes
├── BASE_CONHECIMENTO/   # Base juridica / referencias do escritorio
├── UTILS/               # Scripts utilitarios
│
├── config/              # Configuracoes centralizadas
│   ├── .env             # (criado a partir de .env.example - NAO versionar)
│   ├── .env.example     # Template de variaveis
│   ├── equipe.py         # IDs de usuario ADVBOX por papel
│   ├── regras_financeiras.py # Comissoes/exececoes (configuravel)
│   ├── timbrado_modelo.docx  # Timbrado oficial - AGUARDANDO o escritorio enviar
│   └── credentials.json # (credenciais Google - NAO versionar)
│
├── docs/                # Documentacao (ONBOARDING, DEPLOY_VPS)
├── .claude/             # Agents, Rules, Skills, Commands
├── CLAUDE.md             # Este arquivo
└── requirements.txt
```

## Squad Comercial (INTAKE)
Comando: `python INTAKE/main.py "TRANSCRICAO.pdf" "DOC_PESSOAL.pdf" "CADASTRO.txt"`

Fluxo:
1. IA analisa transcricao (analise tecnica + questionario) - previdenciario,
   ou militar
2. OCR extrai dados do documento pessoal (CNH/RG)
3. Cria pasta do cliente (3 subpastas padrao)
4. Gera Ficha do Cliente (documento guia)
5. Gera Contrato (numero sequencial automatico)
6. Gera Procuracao
7. Gera Declaracao de Hipossuficiencia (se aplicavel)
8. Envia para assinatura digital (ZapSign, se configurado)
9. Envia mensagem ao cliente via WhatsApp (Atende Direito, se configurado)
10. Cadastra cliente + processo no ADVBOX (se o escritorio usar)
11. Sync docs assinados -> pasta do cliente

## Squad Financeiro (FINANCEIRO)
Comando unico: `python FINANCEIRO/fechamento_mensal.py MM/YYYY`
Sem lancar comissoes: `python FINANCEIRO/fechamento_mensal.py 03/2026 --sem-lancar`

Regras (configuraveis em `config/regras_financeiras.py`):
- Fonte da verdade: ADVBOX (por vencimento, nao competencia), se o escritorio usar ADVBOX.
- Comissoes, exececoes e provisoes: cadastrar no onboarding (vem VAZIO - o
  escritorio tem hoje um unico advogado responsavel, sem estrutura de
  comissionamento definida).
- Distribuicao de lucros NAO e despesa operacional.

## Squad Operacional (OPERACIONAL)
Comandos:
- Tarefas pendentes: `python OPERACIONAL/main.py tarefas`
- Processos ativos: `python OPERACIONAL/main.py processos`
- Prazos fatais: `python OPERACIONAL/main.py prazos`
- Criar tarefa: `python OPERACIONAL/main.py criar-tarefa <lawsuit_id> ACOMPANHAMENTO <responsavel> -m "mensagem" -p 2026-04-08 --urgente`

Regras:
- Tarefas ADVBOX usam endpoint /posts (nao /tasks)
- Campo `from` e o usuario responsavel (config/equipe.py / .env)
- Campo de mensagem e "comments" (nao "notes")
- Nunca criar tarefa sem autorizacao explicita
- Pecas geradas sao SEMPRE PARA REVISAO da Dra. Fabiana antes de protocolar
  - ver "Regra de ouro" acima.

## Agentes juridicos (agentes_claude/ e .claude/agents/)

Dois agentes especializados por area, mais os agentes de pipeline (analista-juridica,
gerador-documentos, compliance-reviewer, revisora-controladoria):

| Agente | Area | Status |
|---|---|---|
| `carneiro-previdenciario.md` | Previdenciario (BPC/LOAS, aposentadorias, incapacidade, pensao por morte) | Base generica - pendente calibracao |
| `carneiro-militar.md` | Militar (PAD/Conselhos, reforma, promocao, pensao militar, MS) | Base generica - pendente calibracao |

Todos seguem a mesma regra de ouro: nunca protocolam, sempre entregam peca
marcada "PRONTA PARA REVISAO DA DRA. FABIANA". Ver `agentes_claude/GUIA_INSTALACAO_CLAUDE_AI.md`
para instalar como Projects/Skills no Claude.ai, ou usar direto como subagentes
do Claude Code (ja copiados em `.claude/agents/`).

## Agente Operacional (CARNEIRO.IA)
Servidor webhook (FastAPI) que recebe disparos e executa categorias:
peca juridica, notificacao de cliente, envio para assinatura, sincronizar
assinados, consultar assinatura e movimentacao processual. Inicia via
`OPERACIONAL/agente_operacional/iniciar_servicos.bat` (Windows) ou `.sh`
(macOS/Linux).

## ADVBOX API (uso NAO CONFIRMADO)
Nao ha confirmacao de que o escritorio use o ADVBOX. Se confirmado no onboarding:
- Base: https://app.advbox.com.br/api/v1
- Auth: Bearer token + User-Agent obrigatorio
- Endpoint tarefas: /posts (GET e POST)
- Endpoint processos: /lawsuits
- Endpoint financeiro: /transactions
- Rate limit: GET 30/min | POST 500/dia
- Token: `config/.env` -> `ADVBOX_API_TOKEN` (AGUARDANDO)

## Padroes de peca
- Toda peca juridica e gerada no timbrado do escritorio (config/timbrado_modelo.docx
  - AGUARDANDO a Dra. Fabiana enviar o arquivo real, ver docs/ONBOARDING.md).
- Assinatura padrao: Dra. Fabiana Silva Alves Carneiro - OAB/RJ 188.762 -
  Rio de Janeiro/RJ.
- Formatacao: Montserrat 11pt, justificado, espacamento 1,5, recuo de 1a linha
  7cm, citacoes recuadas em italico (padrao PAB, ver
  `.claude/rules/padroes-documentos.md` - confirmar com o escritorio se quer
  manter este padrao ou tem o proprio).
- Previdenciario e Militar ainda usam o playbook padrao da area
  (`agentes_claude/carneiro-*.md`) ate a Dra. Fabiana enviar pecas reais
  protocoladas para calibracao.

## Credenciais (config/.env)
Todas as credenciais ficam em config/.env (copiar de config/.env.example).
NUNCA versionar o .env. Nenhuma credencial foi recebida ate a criacao deste
repositorio - ver docs/ONBOARDING.md para o checklist completo.
