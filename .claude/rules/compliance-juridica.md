# Regras de Compliance Juridica - Alves Carneiro Advocacia e Consultoria Jurídica

## Campos Obrigatorios por Documento

### Ficha do Cliente (DOCUMENTO GUIA)
A ficha e o documento principal. Deve ser preenchida PRIMEIRO.
Todos os demais documentos sao gerados a partir dos dados da ficha.

### Dados que devem vir de documentos pessoais (CNH, RG)
- Nome completo
- CPF
- RG e orgao emissor
- Nacionalidade
- Data de nascimento

### Dados que devem vir do cadastro/reuniao
- Telefone
- Email
- Endereco completo
- Estado civil
- Profissao
- Parte contraria / empresa reclamada
- Indicante
- Origem

## Validacoes Criticas
- CPF deve estar no formato XXX.XXX.XXX-XX
- Datas no formato DD/MM/YYYY
- Endereco deve ter: rua, numero, bairro, cidade, estado, CEP
- Nunca inventar dados - se nao tem, deixar o placeholder

## Direitos Previdenciarios a Validar (area principal - Dra. Fabiana)
- Tempo de contribuicao / carencia (RGPS e RPPS)
- Averbacao de periodos (CTC, vinculos, tempo rural)
- Enquadramento em regras de transicao (EC 103/2019)
- Aposentadoria especial - exposicao a agente nocivo, PPP/LTCAT
- Aposentadoria do professor - tempo de magisterio, funcoes equiparadas
- Previdencia rural - inicio de prova material + prova testemunhal
- Beneficio por incapacidade / avaliacao biopsicossocial (quando aplicavel)
- Revisao de RMI, buraco negro, indice de correcao

## Direitos Militares a Validar (area de expansao - base generica, ver agentes_claude/carneiro-militar.md)
- Processo Administrativo Disciplinar (PAD) / Sindicancia - contraditorio e ampla defesa
- Conselho de Disciplina (pracas) / Conselho de Justificacao (oficiais) - nulidades
- Exclusao/licenciamento a bem da disciplina
- Reforma por incapacidade (moléstia/acidente em servico)
- Junta Militar de Saude (JMS) / Junta de Inspecao de Saude (JIS)
- Promocao - preterição, ressarcimento de preterição
- Pensao militar - dependentes, habilitacao
- Mandado de Seguranca contra ato de autoridade militar

> Observacao: o escritorio atua em duas frentes - Previdenciario e Militar (ambas
> bases genericas pendentes de calibracao com pecas reais protocoladas pela Dra.
> Fabiana - o briefing formal de onboarding ainda nao foi preenchido). Ajustar o
> rol de verificacao conforme a area do caso. Abrangencia geografica: Rio de
> Janeiro/RJ.
