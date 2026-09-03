# Guia de Instalação — Agentes Carneiro no Claude.ai

Este guia mostra como instalar os agentes da Dra. **Fabiana Silva Alves Carneiro** (Alves Carneiro Advocacia e Consultoria Jurídica) como **Projects** no Claude.ai (https://claude.ai).

## Agentes disponíveis nesta pasta

### Custom Instructions (Projects do Claude.ai)

| Arquivo | Para que serve | Quando usar |
|---|---|---|
| `carneiro-previdenciario.md` | **Previdenciário** — BPC/LOAS, aposentadorias, benefícios por incapacidade, pensão por morte, revisões. ⚠️ base genérica, ainda não calibrada com material real da Dra. Fabiana. | Casos previdenciários. |
| `carneiro-militar.md` | **Militar** — PAD/Conselhos de Disciplina e Justificação, reforma, promoção, pensão militar, Mandado de Segurança. ⚠️ base genérica, ainda não calibrada. | Casos de Direito Militar (Forças Armadas / militares estaduais). |

> **Boas práticas:** crie **um Project separado para cada agente**. Cada um tem foco diferente e responde melhor isolado.

### Skills empacotadas (Claude.ai)

Skills ficam disponíveis na conta inteira (não só em um Project) — o Claude as invoca automaticamente conforme o pedido. Para empacotar, abra um chat **novo** no Claude.ai (Chrome ou app) e **cole o prompt abaixo**. O Claude responde com um pacote pronto para instalação.

| Arquivo (prompt) | Nome da skill que será criada | Quando o Claude vai invocar sozinho |
|---|---|---|
| `prompt-criar-skill-timbrado.md` | `timbrado-carneiro` | Toda vez que for preciso gerar um DOCX no papel timbrado oficial do escritório. |

> **Ordem de instalação:** instale `timbrado-carneiro` primeiro. Antes de instalar, suba no seu Drive o arquivo `TIMBRADO_CARNEIRO.docx` (cabeçalho/rodapé oficiais do escritório) — **ainda não recebido**, ver `docs/_WHITE_LABEL_SPEC.md`.

**Por que ter os dois formatos?**
- **Custom Instructions** dá controle máximo dentro de um Project (e permite subir base de conhecimento dedicada).
- **Skill** funciona em qualquer conversa da conta da Dra. Fabiana, e é invocada automaticamente quando ela pede algo que se encaixe na descrição.

Recomendo usar os **dois em paralelo**: Projects pra trabalhar casos complexos com base de conhecimento dedicada; Skills pra produtividade do dia a dia.

## Pré-requisitos

- Conta Claude.ai da Dra. Fabiana
- **Plano Claude Pro ou Max** (Projects não estão disponíveis no plano Free)

## Passo a passo

### 1. Criar os Projects

Para **cada agente**, repita:

1. Abra https://claude.ai
2. No menu lateral esquerdo, clique em **"Projects"**
3. Clique em **"+ Create Project"** (canto superior direito)
4. Preencha conforme a tabela abaixo:

| Arquivo `.md` | Nome do Project | Descrição |
|---|---|---|
| `carneiro-previdenciario.md` | **Carneiro Prev — Previdenciário** | Assistente previdenciária da Dra. Fabiana Silva Alves Carneiro (OAB/RJ 188.762) — diagnóstico, estratégia, iniciais, recursos. |
| `carneiro-militar.md` | **Carneiro Mil — Militar** | Assistente de Direito Militar da Dra. Fabiana Silva Alves Carneiro (OAB/RJ 188.762) — PAD, Conselhos, reforma, promoção, pensão militar, MS. |

5. Clique em **"Create"**

### 2. Configurar as instruções (Custom Instructions)

Para cada Project:

1. Dentro do Project, clique em **"⚙️ Set Instructions"** (ou "Custom Instructions" — o nome muda conforme a versão)
2. Abra o arquivo `.md` correspondente desta pasta
3. **Pule as primeiras linhas** entre `---` (o bloco frontmatter, com `name:` / `description:` / `model:`)
4. Cole **todo o resto do arquivo** — começando pelo primeiro `# Título`
5. Clique em **"Save"**

### 3. Subir base de conhecimento (recomendado)

Em cada Project, clique em **"+ Add knowledge"** e suba:

**Para o Carneiro Prev:**
- **Petições/pareceres previdenciários modelo** da Dra. Fabiana (DOCX/PDF) — calibra tom e estrutura
- **Papel timbrado** do escritório
- **Procuração, contrato de honorários e declaração de hipossuficiência** (modelos)

**Para o Carneiro Mil:**
- **Defesas/PADs modelo** já protocolados pela Dra. Fabiana
- **Papel timbrado** do escritório

> Essencial mínimo em ambos: **timbrado** + **uma peça real já protocolada** (qualquer que seja).

### 4. Testar

**Carneiro Prev:**
> "Cliente teve auxílio-doença cessado. Laudo médico atestando incapacidade, CNIS mostra última contribuição há poucos meses. Qual a estratégia? Recurso administrativo ou ação judicial?"

Esperado: aplica a Estrutura de Análise Padrão, aponta opções e gestão de risco, pergunta o que falta antes de redigir qualquer peça.

**Carneiro Mil:**
> "Militar respondendo a Conselho de Disciplina por falta grave. Quer saber se há nulidade no processo — o prazo de defesa foi curto e não teve acesso a todos os documentos antes da audiência."

Esperado: aplica a Estrutura de Análise Padrão, avalia cerceamento de defesa, pergunta o que falta antes de redigir qualquer peça.

## Variação para Claude Code (avançado — opcional)

Se a Dra. Fabiana quiser usar os agentes **dentro do Claude Code** (CLI) como subagentes, basta copiar os arquivos `carneiro-previdenciario.md` e `carneiro-militar.md` para `.claude/agents/` no repositório dela — o frontmatter (`---`) é mantido. O Claude Code reconhece automaticamente.

---

## Manutenção

- **Atualizar o agente:** edite o `.md` correspondente e cole novamente nas Custom Instructions.
- **Adicionar nova peça modelo:** suba na knowledge base do Project — o agente passa a usar imediatamente.
- **Bug ou ajuste fino:** abra um chamado com o time PAB (Weverton).
