# Alves Carneiro Advocacia e Consultoria Jurídica — Central de Automacoes

Plataforma de automacao juridica do escritorio **Alves Carneiro Advocacia e Consultoria Jurídica**
(Dra. Fabiana Silva Alves Carneiro — OAB/RJ 188.762 — Rio de Janeiro/RJ).

Areas de atuacao: **Previdenciario** (BPC/LOAS, aposentadorias, beneficios por
incapacidade, pensao por morte, revisoes) e **Militar** (PAD/Conselhos de
Disciplina e Justificacao, reforma, promocao, pensao militar, Mandado de
Seguranca contra ato de autoridade militar).

> **A IA nunca protocola.** Toda peca gerada por estas automacoes e para revisao
> humana da Dra. Fabiana antes de qualquer protocolo.

## Agentes juridicos de IA

Este repositorio inclui 2 agentes juridicos prontos em `agentes_claude/` (e
copiados como subagentes do Claude Code em `.claude/agents/`), alem dos agentes
de pipeline (analista-juridica, gerador-documentos, compliance-reviewer,
revisora-controladoria):

| Agente | Area | Status |
|---|---|---|
| `carneiro-previdenciario.md` | Previdenciario (BPC/LOAS, aposentadorias, incapacidade, pensao por morte) | ⚠️ Base generica — pendente calibracao com pecas reais |
| `carneiro-militar.md` | Militar (PAD/Conselhos, reforma, promocao, pensao militar, MS) | ⚠️ Base generica — pendente calibracao com pecas reais |

Os dois agentes foram montados com o playbook juridico padrao da area
(legislacao + jurisprudencia consolidada), mas ainda nao tem o tom, as teses
preferidas e a estrutura reais da Dra. Fabiana — o briefing de onboarding
tambem ainda nao foi preenchido por ela. Assim que ela enviar 1-2 pecas ja
protocoladas em cada area, os arquivos devem ser refeitos puxando o estilo
real. Ver `agentes_claude/GUIA_INSTALACAO_CLAUDE_AI.md` para instalar como
Projects/Skills no Claude.ai.

## Frentes de automacao (engenharia completa)

Alem dos agentes juridicos, este repositorio traz o mesmo motor de automacao
usado pelos demais escritorios parceiros — adaptado para o Alves Carneiro
Advocacia e Consultoria Jurídica:

| Squad | O que faz | Comando-chave |
|-------|-----------|---------------|
| **INTAKE** | Intake comercial: analisa o caso (IA), gera Ficha/Contrato/Procuracao/Declaracao, envia para assinatura e cadastra no ADVBOX (se configurado) | `python INTAKE/main.py ...` |
| **FINANCEIRO** | Fechamento mensal, conciliacao Asaas×ADVBOX e cobranca semanal por WhatsApp (se configurado) | `python FINANCEIRO/fechamento_mensal.py MM/YYYY` |
| **OPERACIONAL** | Tarefas, processos, prazos e geracao de peticoes; agente CARNEIRO.IA (webhook) | `python OPERACIONAL/main.py tarefas` |
| **SYNC** | Sincroniza documentos assinados (ZapSign → Drive) | `python SYNC/sync_assinados.py` |

> **Nenhuma credencial de sistema foi recebida ainda** (ADVBOX, Asaas, ZapSign,
> Atende Direito, Google Drive) — nem confirmacao de quais desses sistemas o
> escritorio realmente usa. Ate serem confirmados/preenchidos, INTAKE/
> FINANCEIRO/SYNC ponta-a-ponta nao funcionam; o que roda hoje sao os agentes de
> IA (produzir pecas sobre documentos soltos). Ver `docs/ONBOARDING.md`.

## Instalacao rapida

```bash
# 1. Ambiente
python -m venv venv
venv\Scripts\activate          # Windows  (macOS/Linux: source venv/bin/activate)
pip install -r requirements.txt
playwright install chromium    # para geracao de PDF

# 2. Configuracao
copy config\.env.example config\.env   # (macOS/Linux: cp config/.env.example config/.env)
# preencher TODOS os campos conforme docs/ONBOARDING.md (nada vem preenchido)
# coloque config/credentials.json (Google Cloud) na pasta config/

# 3. Teste
python OPERACIONAL/main.py tarefas
```

> **Antes de rodar em producao, leia `docs/ONBOARDING.md`** — ele lista, passo a
> passo, todas as credenciais e IDs que ainda precisam ser preenchidos. As
> automacoes rodam de forma segura/neutra enquanto algo nao estiver configurado
> (nada e enviado/lancado sem credencial).

## Estrutura
Ver `CLAUDE.md` para a arvore completa e as regras de cada squad.

## Seguranca
- Segredos ficam **somente** em `config/.env` (nunca versionado — ver `.gitignore`).
- Nenhuma credencial vem pre-preenchida neste repositorio.
