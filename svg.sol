// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.12;




library SvgGen {


function display_svg1(uint256 del_x, uint256 del_y){
    string svg = '<path class="st0" d="M' + (262.6 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-27.87,221.7-2.59,289.11" style="transform:scale(' + svgScale + ')"/>';

}





function svg(uint256 n) public pure returns (string memory){
    //create a uint256 number
    uint256 number = n;

    // orderdel is  = to 1000 divided by the ceiling of the square root of the number divided by 5
    uint256 orderdel = 1000 / uint256(uint256(number).sqrt().ceil() / 5);


    string svgHeader = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 1024 1024" style="enable-background:new 0 0 1024 1024;" xml:space="preserve"><style type="text/css">.st0{fill:none;stroke:#ED2224;stroke-width:20;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;}</style>';
    string svgFooter = '</svg>';


}

}