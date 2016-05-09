$(document).ready(function () {

    $.getJSON('json.json', function (x) {
        order = [];
        
        $j = x;
        $str = "<ul>";
        $content ="";
        for ($dish in $j) {
            console.log($j[$dish]);
            $content +=" <li class='wow fadeInLeft' data-wow-duration='300ms' data-wow-delay='300ms'>";
            $content += "<div class='blog-img'>";
            $content += "<img src='http://cdn.graphicsfactory.com/clip-art/image_files/tn_image/9/1342189-tn_1779-Fast-Food-Hamburger-Drink-And-French-Fries.jpg' alt='blog-img'>";
            $content+="</div>";
            $content+="<div class='content-right'>";
            $content += "<h3>" + $j[$dish].dish + "</h3><h6>" + $j[$dish].price+ "</h6>";
            $content += "<p>" + $j[$dish].about + "</p>";
            $content+="</div></li>";

     
        };
        $en ="</ul>";
        $("#menu").append($str);
        $("#menu").append($content);
        $("#menu").append($en);
    });

});

                         
                              
                                  
                              
                              
                                  
                          