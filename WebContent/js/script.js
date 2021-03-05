$(document).ready(function(){
    $('#head_wrap').mouseover(function () {
        $('header .bg').css({ 'top': 0, 'opacity': 1 });
    }).mouseout(function () {
        $('header .bg').css({ 'top': '-700px', 'opacity': 0 });
    });


    $('.side_navi > ul > li > a').mouseover(function(){
        $(this).next('ul').slideDown();
    }).mouseout(function(){
        $(this).next('ul').slideUp();
    });



    $(window).resize(function(){
        // location.reload();
        var width = window.innerWidth;
        console.log(width);
        if(width<=480){
            $('.slick-container').slick({
                infinite: true,
                speed:300,
                autoplay:true,
                autoplaySpeed: 5000,
                slidesToShow: 1
            });
        }else if(width<=768){
            $('.slick-container').slick({
                infinite: true,
                speed:300,
                autoplay:true,
                autoplaySpeed: 5000,
                slidesToShow: 3
            });
        }else{
            $('.slick-container').slick({
                infinite: true,
                speed:300,
                autoplay:true,
                autoplaySpeed: 5000,
                slidesToShow: 4
            });
        }
    }).resize();

	
    
});

