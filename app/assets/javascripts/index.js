$(document).on('turbolinks:load', function(){
  $('.slick').not('.slick-initialized').slick({
    autoplay:true,  
    dots:true,      
  });
});