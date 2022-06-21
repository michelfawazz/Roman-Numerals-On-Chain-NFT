// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
                                             

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./ERC721A.sol";
import "./Base64.sol";
import "./RomanNumerals.sol";

contract NFT is Ownable, ERC721A, PaymentSplitter {
    using Strings for uint;

    struct Numbers { 
      string name;
      string description;
      string bgHue;
      string textHue;
      string value;
   }
  
    mapping (uint256 => Numbers) public nums;


    uint private teamLength;

    //Addresses of all the members of the team
    address[] private _team = [
       //address receiver

    ];

    //Shares of all the members of the team
    uint[] private _teamShares = [
        100
    ];

    constructor() ERC721A("NFT", "NFT")
    PaymentSplitter(_team, _teamShares) {
        teamLength = _team.length;
    }

    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract");
        _;
    }

    

    function publicSaleMint(address _account) external payable callerIsUser {
        uint256 supply = totalSupply();
        Numbers memory newWord = Numbers(
            string(abi.encodePacked('NUMERAL #', uint256(supply + 1).toString())), 
            "Pretty Awesome Words are all you need to feel good. These NFTs are there to inspire and uplift your spirit.",
            randomNum(361, block.difficulty, supply).toString(),
            randomNum(361, block.timestamp, supply).toString(),
            RomanNumerals.convert(supply+1)
            
            );

        nums[supply + 1] = newWord;
        _safeMint(_account, 1);
    }

    function randomNum(uint256 _mod, uint256 _seed, uint _salt) public view returns(uint256) {
      uint256 num = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, _seed, _salt))) % _mod;
      return num;
    }



    function buildImage(uint256 _tokenId) public view returns(string memory) {
      Numbers memory currentWord = nums[_tokenId];
      return Base64.encode(bytes(
          abi.encodePacked(
              '<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg">',
              '<rect height="500" width="500" fill="hsl(',currentWord.bgHue,', 50%, 25%)"/>',
              '<text x="50%" y="50%" dominant-baseline="middle" fill="hsl(',currentWord.textHue,', 100%, 80%)" text-anchor="middle" font-size="41">',currentWord.value,'</text>',
              '</svg>'
          )
      ));
  }

    function buildMetadata(uint256 _tokenId) public view returns(string memory) {
        Numbers memory currentWord = nums[_tokenId];
        return string(abi.encodePacked(
                'data:application/json;base64,', Base64.encode(bytes(abi.encodePacked(
                            '{"name":"', 
                            currentWord.name,
                            '", "description":"', 
                            currentWord.description,
                            '", "image": "', 
                            'data:image/svg+xml;base64,', 
                            buildImage(_tokenId),
                            '"}')))));
    }


    function tokenURI(uint _tokenId) public view virtual override returns (string memory) {
        require(_exists(_tokenId), "URI query for nonexistent token");
        return buildMetadata(_tokenId);
    }


    //ReleaseALL
    function releaseAll() external onlyOwner {
        for(uint i = 0 ; i < teamLength ; i++) {
            release(payable(payee(i)));
        }
    }

    receive() override external payable {
        revert('Only if you mint');
    }


}