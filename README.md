# Sistema de Certificação Acadêmica em Blockchain

Este projeto implementa um sistema de emissão de certificados acadêmicos digitais utilizando a rede Ethereum. O foco principal é a integridade e intransferibilidade dos diplomas através do conceito de **Soulbound Tokens (SBTs)**.

Projeto desenvolvido no contexto da disciplina de **Blockchain e Criptomoedas** (ICMC-USP).

## Funcionalidades

* **Emissão de Certificados:** A instituição (dona do contrato) pode emitir diplomas únicos para a carteira dos alunos.
* **Soulbound Token (SBT):** Implementação de lógica de bloqueio que impede que o aluno transfira ou venda seu diploma para terceiros.
* **Revogação:** Permite à instituição invalidar (queimar) certificados emitidos incorretamente ou em casos de fraude.
* **Metadados:** Suporte a links externos (IPFS/Gist) para armazenar os dados visuais do diploma.

## Tecnologias

* **Solidity 0.8.20:** Linguagem do contrato inteligente.
* **OpenZeppelin:** Biblioteca para padrões de segurança (ERC-721, Ownable).
* **Remix IDE:** Ambiente de desenvolvimento e testes.

## Como Executar

1.  Clone este repositório ou copie o código de `CertificadoAcademico.sol`.
2.  Abra o [Remix IDE](https://remix.ethereum.org/).
3.  Compile o contrato utilizando a versão `0.8.20`.
4.  Faça o Deploy na VM do Remix ou em uma Testnet (como Sepolia).
5.  Utilize as funções `emitirCertificado` e `revogarCertificado` para testar o fluxo.

## Licença

Este projeto está sob a licença MIT.
