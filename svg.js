function svg(n){
    var number=n;
    
    var cnt=1;
    var orderDel = 1000 / Math.ceil(Math.sqrt(number / 5));

    var svgHeader = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 1024 1024" style="enable-background:new 0 0 1024 1024;" xml:space="preserve"><style type="text/css">.st0{fill:none;stroke:#ED2224;stroke-width:20;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;}</style>';
    var svgFooter = '</svg>';

    var svgScale = 2.0 / Math.ceil(Math.sqrt(Math.ceil(number / 5)));
    console.log(svgScale)

    function display_svg1(del_x, del_y) {
        var svg = 
            '<path class="st0" d="M' + (262.6 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-27.87,221.7-2.59,289.11" style="transform:scale(' + svgScale + ')"/>';
        return svg;
    }
    

    function display_svg2(del_x, del_y) {
        var svg = 
            '<path class="st0" d="M' + (221.43 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-27.87,221.7-2.59,289.11" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (290.15 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-8.43,208.73,13.61,280.69" style="transform:scale(' + svgScale + ')"/>';
        return svg;
    }

    function display_svg3(del_x, del_y) {
        var svg = 
            '<path class="st0" d="M' + (189.99 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-27.87,221.7-2.59,289.11" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (258.71 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-8.43,208.73,13.61,280.69" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (326.51 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-10.11,191.23,8.68,265.13" style="transform:scale(' + svgScale + ')"/>' ;
        return svg;
    }

    function display_svg4(del_x, del_y) {
        var svg = 
            '<path class="st0" d="M' + (145.48 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-27.87,221.7-2.59,289.11" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (214.19 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-8.43,208.73,13.61,280.69" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (282 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-10.11,191.23,8.68,265.13" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (356.25 + 512 * del_x) + ',' + (107.23 + 512 * del_y) + 'c0,0,0.63,219.1,5.7,300.78" style="transform:scale(' + svgScale + ')"/>'
        return svg;
    }

    function display_svg5(del_x, del_y) {
        var svg = 
            '<path class="st0" d="M' + (145.48 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-27.87,221.7-2.59,289.11" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (214.19 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-8.43,208.73,13.61,280.69" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (282 + 512 * del_x) + ',' + (103.99 + 512 * del_y) + 'c0,0-10.11,191.23,8.68,265.13" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (356.25 + 512 * del_x) + ',' + (107.23 + 512 * del_y) + 'c0,0,0.63,219.1,5.7,300.78" style="transform:scale(' + svgScale + ')"/>' + 
            '<path class="st0" d="M' + (78.06 + 512 * del_x) + ',' + (315.31 + 512 * del_y) + 'c0,0,12.96-78.44,355.88-152.34" style="transform:scale(' + svgScale + ')"/>'
        return svg;
    }


    var totalcompnent = svgHeader;

    var totalvalue = Math.floor(number/5);
    var numbervalue = number % 5;

    var originX = 0;
    var originY = 0;
    var onlineCnt = 1000 / orderDel;
    var i;
    for(i = 0; i < Math.floor(number / 5); i++) {
        originX = i % onlineCnt;
        originY = Math.floor(i / onlineCnt);

        totalcompnent += display_svg5(originX, originY)
    }

    originX = i % onlineCnt;
    originY = Math.floor(i / onlineCnt);
    if(numbervalue != 0) {
        switch(numbervalue) {
            case 1: totalcompnent += display_svg1(originX, originY); break;
            case 2: totalcompnent += display_svg2(originX, originY); break;
            case 3: totalcompnent += display_svg3(originX, originY); break;
            case 4: totalcompnent += display_svg4(originX, originY); break;
        }
    }

    totalcompnent += svgFooter
    console.log(totalcompnent);
}//fu

svg(500);