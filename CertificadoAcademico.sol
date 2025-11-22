// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Imports das bibliotecas contendo os padrões seguros da OpenZeppelin 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CertificadoAcademico is ERC721URIStorage, Ownable {
    uint256 private _nextTokenID;

    // O consctructor define o nome da nossa coleção (Certificado Blockchain USP) e seu símbolo (USPC)
    constructor() ERC721("Certificado Blockchain USP", "USPC") Ownable(msg.sender) {}

    // -- Emitir o certificado --
    // Apenas o dono do contrato (instituição) pode chamar esta função
    function emitirCertificado(address aluno, string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenID++;
        
        // Cria o NFT e envia para a carteira do aluno
        _mint(aluno, tokenId);
        
        // Grava o link (metadata) no certificado recém-criado
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }

    // -- Revogar o Certificado --
    // Possibilita que o dono (instituição) cancele um certificado (burn) em caso de erro ou fraude
    function revogarCertificado(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    // -- Tornar o certificado intransferível (Soulbound) --
    // Essa função é chamada automaticamente pelo contrato antes de qualquer transferência
    function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
        // Primeiro deixamos o contrato original fazer a lógica dele e descobrir quem é o dono atual (from)
        address from = super._update(to, tokenId, auth);

        // Verificando se é uma tentativa de transferência entre carteiras
        // Se "from" não for zero (não é criação) + "to" não for zero (não é destruição), então a transferência é bloqueada
        if (from != address(0) && to != address(0)) {
            revert("Este certificado e intransferivel!");
        }

        return from;
    }
    
}
