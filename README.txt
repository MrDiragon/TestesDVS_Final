# Avaliação de Ferramentas de Geração de Casos de Teste Combinatórios

Este repositório contém os artefatos, scripts de automação, logs de execução e o relatório técnico desenvolvido para a disciplina de **Teste de Validação de Software**, do Centro de Informática da Universidade Federal de Pernambuco (CIn-UFPE).

O projeto consiste em um estudo empírico comparativo entre ferramentas de **Teste Combinatório (CTG - Combinatorial Test Generation)**.

---

## 👥 Equipe
* **Diego Rafael**
* **Eduardo Teles**
* **Gabriel Albertin**
* **Vinícius Henrique**

📅 **Data:** 15 de Dezembro de 2025  
📍 **Local:** Recife, PE - Brasil

---

## 🎯 Objetivo
O objetivo deste estudo é avaliar, de forma exploratória e comparativa, o desempenho de ferramentas de geração de casos de teste combinatórios (pairwise), considerando diferentes características dos modelos de entrada e critérios de interação.

As ferramentas avaliadas foram:
1.  **PICT (Microsoft):** Ferramenta baseada em modelo declarativo.
2.  **Jenny:** Ferramenta baseada em especificações numéricas, conhecida por ser minimalista.

### Questões de Pesquisa (QPs)
* **QP1:** Como as ferramentas diferem quanto ao tamanho dos conjuntos de teste gerados?
* **QP2:** Qual é o tempo de execução requerido em diferentes cenários de complexidade?
* **QP3:** Como a estabilidade das ferramentas varia entre múltiplas execuções?
* **QP4:** Quais características influenciam mais o desempenho de cada ferramenta?

---

## 🛠️ Metodologia e Ambiente Experimental

Para garantir a validade dos dados, foi realizada uma experimentação controlada com **50 repetições** para cada cenário, visando reduzir a variabilidade externa.

### Hardware Utilizado
As execuções ocorreram em ambiente computacional fixo para garantir condições homogêneas:
* **Equipamento:** Dell Inspiron 3583
* **Processador:** Intel Core i5-8265U (1.60GHz)
* **Memória RAM:** 16 GB
* **GPU:** Intel UHD Graphics 620 (128 MB)
* **Sistema Operacional:** Windows 11

### Modelos de Teste
Foram utilizados dois modelos sintéticos para estressar as ferramentas:
* **M1 (Simples):** 3 parâmetros com 3 valores cada.
* **M2 (Complexo):** 10 parâmetros com até 50 valores cada (Alta complexidade combinatória).

---

## 📊 Principais Resultados

A tabela abaixo resume os dados quantitativos médios obtidos (tempo em milissegundos):

| Modelo | Ferramenta | Tempo Médio (ms) | Desvio Padrão (ms) | Tamanho do Conjunto (Casos) |
| :--- | :--- | :--- | :--- | :--- |
| **M1** | PICT | ~417 ms | ~112 ms | 10 |
| **M1** | Jenny | **~408 ms** | ~107 ms | **9** |
| **M2** | PICT | **~5.959 ms (5,9s)** | **~224 ms** | 3540 |
| **M2** | Jenny | ~27.941 ms (27,9s) | ~4.148 ms | **3331** |

### Análise Qualitativa

#### 🚀 **PICT (Microsoft)**
* **Pontos Fortes:** Extremamente rápido e escalável em modelos complexos. Apresentou altíssima estabilidade (baixo desvio padrão).
* **Usabilidade:** Modelo declarativo intuitivo.
* **Recomendação:** Ideal para pipelines de **CI/CD** onde a velocidade e previsibilidade são críticas.

#### 📉 **Jenny**
* **Pontos Fortes:** Capacidade superior de compactação (gerou conjuntos ~6% menores no cenário complexo).
* **Pontos Fracos:** Sofreu degradação severa de performance no modelo complexo (quase 5x mais lento que o PICT) e alta instabilidade entre execuções.
* **Recomendação:** Ideal para cenários onde o **custo de armazenamento ou execução manual** dos testes é mais caro que o tempo de geração (foco em "tamanho do output").

---

## 📂 Estrutura do Repositório

* `/logs`: Contém os arquivos brutos de saída das ferramentas (`*_timeX.txt`).
* `/modelos`: Arquivos de definição dos modelos M1 e M2 para PICT e Jenny.
* `/relatorio`: Versão em PDF do relatório técnico final.
* `/scripts`: Scripts utilizados para automação das 50 execuções.

---

## 🔗 Referências

O embasamento teórico e trabalhos relacionados utilizados neste estudo incluem:
1.  *Machine Learning Applied to Software Testing: A Systematic Mapping Study* (Durelli et al.)
2.  *Research on software testing techniques and software automation testing tools* (Li et al.)
3.  *Software Testing Evolution* (Silva et al., 2025)

---
*Projeto realizado para a disciplina de Teste de Validação de Software - CIn/UFPE.*
