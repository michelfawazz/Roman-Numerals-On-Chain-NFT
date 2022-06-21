// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.12;

library RomanNumerals {
  struct Roman {
    string symbol;
    uint value;
  }

  function convert(uint n) public pure returns (string memory) {
    Roman[13] memory romanNumeralsToNumber = [
      Roman("M", 1000),
      Roman("CM", 900),
      Roman("D", 500),
      Roman("CD", 400),
      Roman("C", 100),
      Roman("CX", 90),
      Roman("L", 50),
      Roman("XL", 40),
      Roman("X", 10),
      Roman("IX", 9),
      Roman("V", 5),
      Roman("IV", 4),
      Roman("I", 1)
    ];

    uint input = n;
    string memory output;

    for (uint i = 0; i < romanNumeralsToNumber.length; i++) {
      while (input >= romanNumeralsToNumber[i].value) {
        output = string(abi.encodePacked(output, romanNumeralsToNumber[i].symbol));
        input -= romanNumeralsToNumber[i].value;
      }
    }

    return string(output);
  }
}