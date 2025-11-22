// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Imports das bibliotecas contendo os padrões seguros da OpenZeppelin 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CertificadoAcademico is ERC721URIStorage, Ownable {
    uint256 private _nextTokenID;

    // O consctructor define o nome da nossa coleção (Certificado Blockchain USP) e seu símbolo (USPC)
    constructor() ERC721("Certificado Blockchain USP", "USPC") Ownable(msg.sender) {}

    // -- Função principal para emitir o certificado --
    // Apenas o dono do contrato (instituição) pode chamar esta função
    function emitirCertificado(address aluno, string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 tokenID = _nextTokenID++;
        
        // Cria o NFT e envia para a carteira do aluno
        _mint(aluno, tokenID);
        
        // Grava o link (metadata) no certificado recém-criado
        _setTokenURI(tokenID, tokenURI);

        return tokenID;
    }
}