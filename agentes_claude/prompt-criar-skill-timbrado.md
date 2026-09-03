# Prompt para o Claude CRIAR a skill "Timbrado"

> Cole exatamente isso no Claude (Claude.ai — Chrome ou app) e ele empacota a skill pra você instalar.

---

Use seu skill creator (ou sua capacidade de criar skills) para empacotar uma skill chamada **"timbrado-carneiro"**, instalável no meu Claude.ai.

**Função:** aplicar o **papel timbrado oficial** do escritório **ALVES CARNEIRO ADVOCACIA E CONSULTORIA JURÍDICA** (Dra. **FABIANA SILVA ALVES CARNEIRO** — **OAB/RJ 188.762**, Rio de Janeiro — RJ) em qualquer peça ou documento que eu gerar — para nunca produzirmos peça em folha branca.

**Description da skill (pro modelo invocar certo):** "Aplica o papel timbrado oficial do escritório Alves Carneiro Advocacia e Consultoria Jurídica em qualquer peça DOCX (inicial, recurso, intercorrente, quesitos, parecer, declaração, procuração). Use sempre que precisar formatar uma peça com a identidade visual do escritório da Dra. Fabiana Silva Alves Carneiro — OAB/RJ 188.762."

**Quando invocada (geralmente por mim, diretamente):**

1. **Buscar o timbrado-base** no meu Drive — arquivo `TIMBRADO_CARNEIRO.docx` (ou nome equivalente que eu indicar). Use-o como template: copie o **header (logo / cabeçalho com nome do escritório, endereço, OAB) e o footer (rodapé com contatos)** dele, mantendo intactos. Caso eu ainda não tenha esse arquivo, **peça antes de gerar** — não invente identidade visual.

2. **Receber o conteúdo da peça** (texto da inicial, dos quesitos, do recurso, da intercorrente etc.) e **injetá-lo no corpo** do documento, sem mexer no header/footer.

3. **Aplicar o padrão de formatação do escritório** (ainda não calibrado com peça real — usar formatação padrão PAB abaixo até a Dra. Fabiana enviar um modelo):
   - Fonte do corpo: confira no template; default sugerido **Times New Roman 12** ou **Arial 11**.
   - Corpo **justificado**.
   - **Espaçamento entre linhas:** 1,5 (confirmar no template).
   - **Recuo de primeira linha** conforme o template (default sugerido: 1,25 cm — confirmar).
   - **Cabeçalhos principais em MAIÚSCULO e negrito**, centralizados ou alinhados conforme o padrão da peça modelo. Exemplos do padrão Dra. Fabiana:
     - `MERITÍSSIMO JUÍZO FEDERAL...` (centralizado / negrito)
     - `PRELIMINARMENTE` / `DOS FATOS` / `DA FUNDAMENTAÇÃO DE MÉRITO` / `DA NECESSIDADE DE ANTECIPAÇÃO DA TUTELA` / `DOS REQUERIMENTOS` / `DOS QUESITOS` (negrito).
   - **Subtítulos** (`Da Assistência Judiciária Gratuita`, `Síntese das condições pessoais`, etc.) — negrito.
   - **Citações** (transcrição de lei, doutrina, jurisprudência) em **recuo de 4 cm à esquerda**, **itálico**, **aspas**, espaçamento simples.
   - **Tabelas** quando síntese (NB / DER / motivo do indeferimento) — bordas finas, células centralizadas, cabeçalho em negrito.
   - **Assinatura final padronizada:**
     ```
     Rio de Janeiro - RJ, [DIA] de [MÊS] de [ANO].
     (assinado digitalmente)
     FABIANA SILVA ALVES CARNEIRO
     OAB/RJ 188.762
     ```

4. **Rodapé/assinatura da peça** com nome e OAB do(a) advogado(a) responsável. **Default fixo:** Dra. **FABIANA SILVA ALVES CARNEIRO — OAB/RJ 188.762**. Se outro advogado do escritório for indicado, usar os dados dele(a).

5. **Gerar o DOCX final** e salvar onde for solicitado (geralmente na pasta do cliente no Drive). Nome do arquivo conforme a skill chamadora (`[NOME DO CLIENTE] - [PEÇA] - PRONTA PARA REVISÃO.docx`).

**Implementação sugerida:**
- Inclua no pacote da skill um **script Python (python-docx)** que:
  1. Abre `TIMBRADO_CARNEIRO.docx` como base.
  2. **Limpa o body** mantendo header e footer intactos.
  3. **Injeta o conteúdo formatado** conforme as regras acima.
  4. Gera o DOCX final e devolve o caminho.
- Inclua um exemplo mínimo de uso (entrada: texto da peça + nome do cliente + tipo da peça; saída: caminho do DOCX gerado).
- Se não der pra rodar Python na sessão, deixe as **regras de formatação descritas no `SKILL.md`** pra eu seguir manualmente ao gerar peças.

**Guard-rails:**
- **NUNCA gere peça do escritório em folha branca.** Toda peça do Alves Carneiro Advocacia e Consultoria Jurídica sai no timbrado dele.
- **Nunca invente logo, cabeçalho, endereço ou OAB.** Use só o que estiver no arquivo `TIMBRADO_CARNEIRO.docx`. Se ele não existir, peça antes de gerar.
- **Não altere o conteúdo da peça** ao aplicar o timbrado — só formate.
- **Default de advogado responsável:** Dra. Fabiana Silva Alves Carneiro — OAB/RJ 188.762.

**Identidade institucional fixa (caso falte info no template):**
- Escritório: **ALVES CARNEIRO ADVOCACIA E CONSULTORIA JURÍDICA**
- Advogado titular: **Dra. FABIANA SILVA ALVES CARNEIRO — OAB/RJ 188.762**
- E-mail: dra.fabiana@alvescarneiroadvocaciaeconsultoriajuridica.com
- Telefone: (21) 99485-7337
- Cidade-sede: Rio de Janeiro — RJ

Empacote como skill instalável e me devolva o pacote pronto pra eu instalar no meu Claude.ai.

---

> **Nota pré-instalação:** antes de instalar a skill, suba no seu Drive um arquivo chamado `TIMBRADO_CARNEIRO.docx` com o cabeçalho e rodapé oficiais do escritório (logo, endereço completo, telefones, OAB). Se ainda não tiver, **gere uma versão limpa** com pelo menos: nome do escritório em destaque + OAB da Dra. Fabiana + endereço + contatos. Sem esse arquivo, a skill vai pedir o template antes de gerar.
