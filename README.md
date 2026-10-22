# TP01 — Integração de Sistemas de Informação

**Aluno:** José Miguel Sousa  
**Número de aluno:** 31552  
**Curso:** Licenciatura em Engenharia de Sistemas Informáticos  
**Ano letivo:** 2026/2027

## 1. Descrição do projeto

O presente projeto consiste no desenvolvimento de um processo ETL (*Extract, Transform and Load*) através da plataforma KNIME, destinado à integração, transformação e análise de dados de um portefólio fictício de criptoativos.

A solução integra três fontes de informação:

- **Ficheiro CSV:** registos de aquisição dos criptoativos.
- **API REST CoinGecko:** preços de mercado e capitalização dos criptoativos.
- **Banco Central Europeu (BCE):** taxa de câmbio obtida através de um documento XML.

Após a integração e normalização dos dados, são calculados o valor atual das posições, o custo total de aquisição e o respetivo lucro ou prejuízo (P&L), expressos em euros.

Os resultados são armazenados numa base de dados PostgreSQL alojada na plataforma Neon, exportados para Excel, cifrados através de AES-256 e enviados por correio eletrónico. A informação armazenada pode ainda ser consultada através de um dashboard desenvolvido em Grafana.

## 2. Estrutura de diretórios

```text
tp01-31552/
│
├── README.md
│
├── doc/
│   └── 31552_doc.pdf
│
├── dataintegration/
│   └── [Workflow KNIME]
│
├── data/
│   ├── [Ficheiros utilizados pelo workflow]
│   │
│   ├── input/
│   │   └── [Exemplos de dados de entrada]
│   │
│   └── output/
│       └── [Exemplos de resultados]
│
└── src/
    └── [Scripts de desencriptação]
```

### Observação sobre os diretórios de dados

Os diretórios `data/input/` e `data/output/` contêm ficheiros de exemplo, organizados de acordo com a estrutura de entrega sugerida.

Os ficheiros efetivamente utilizados pelo workflow encontram-se diretamente na pasta `data/`, de forma a preservar os caminhos relativos definidos durante o desenvolvimento no KNIME.

Esta organização permite manter a configuração original do projeto sem necessidade de alterar os caminhos dos nós de leitura, exportação e processamento.

## 3. Tecnologias utilizadas

| Tecnologia | Finalidade |
|---|---|
| KNIME | Desenvolvimento e execução do processo ETL |
| CSV | Armazenamento dos dados de aquisição |
| CoinGecko API | Obtenção das cotações de mercado |
| Banco Central Europeu | Obtenção da taxa de câmbio |
| PostgreSQL | Persistência dos resultados |
| Neon | Alojamento da base de dados |
| Microsoft Excel | Exportação dos dados processados |
| Java | Implementação da cifra AES-256 |
| PowerShell | Desencriptação dos ficheiros |
| Correio eletrónico | Envio do ficheiro cifrado |
| Grafana | Visualização das métricas financeiras |

## 4. Execução do projeto

Para executar o processo ETL:

1. Abrir a plataforma KNIME Analytics Platform.
2. Importar ou abrir o workflow disponibilizado no diretório `dataintegration/`.
3. Confirmar que os ficheiros necessários se encontram na pasta `data/`, mantendo a estrutura relativa esperada pelo workflow.
4. Verificar a ligação à Internet e as configurações de acesso aos serviços externos e à base de dados PostgreSQL.
5. Executar o workflow no KNIME.
6. Consultar os resultados na base de dados PostgreSQL e nos ficheiros gerados na pasta `data/`.

O processo inclui ainda a cifra do ficheiro Excel e o seu envio por correio eletrónico, dependendo da configuração do respetivo serviço de email.

**Nota:** a execução completa pode exigir a configuração de credenciais de acesso à base de dados e ao serviço de correio eletrónico.

## 5. Desencriptação do ficheiro Excel

Após a execução do workflow, o ficheiro Excel exportado é submetido a um processo de cifra AES-256-CBC, implementado através de código Java no KNIME.

Para recuperar o ficheiro original, foi desenvolvido um script executável em ambiente Windows, disponibilizado na pasta `src/`.

A desencriptação utiliza os mesmos parâmetros criptográficos definidos no processo de cifra. Após a sua execução, é recuperado o ficheiro XLSX, que pode ser aberto através do Microsoft Excel ou de uma aplicação compatível.

## 6. Visualização dos resultados

O dashboard Grafana utiliza a base de dados PostgreSQL como fonte de informação.

Através de consultas SQL, é possível visualizar os indicadores financeiros do portefólio, incluindo o valor atual das posições, o custo de aquisição e o lucro ou prejuízo.

O registo temporal das execuções permite ainda consultar dados históricos, desde que existam diferentes snapshots armazenados.

## 7. Documentação e demonstração

O relatório técnico encontra-se disponível em:

`doc/31552_doc.pdf`

O documento descreve a arquitetura da solução, as transformações realizadas, os cálculos financeiros, os processos de persistência e exportação, os mecanismos de proteção criptográfica e as limitações identificadas.

O acesso ao vídeo de demonstração do funcionamento do projeto é disponibilizado no relatório através de uma hiperligação e de um código QR.

## 8. Observações finais

- Os dados do portefólio são fictícios e destinam-se exclusivamente a fins académicos.
- A execução depende da disponibilidade dos serviços externos utilizados.
- As cotações e as taxas de câmbio podem variar entre execuções.
- O mecanismo de cifra foi desenvolvido para fins demonstrativos e não deve ser considerado uma solução de segurança pronta para produção.
- A organização dos diretórios procura preservar a configuração original do workflow KNIME.

---

**Unidade Curricular:** Integração de Sistemas de Informação  
**Trabalho Prático 01 — Ano letivo 2026/2027**
