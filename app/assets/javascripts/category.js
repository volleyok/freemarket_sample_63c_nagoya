$(document).on('turbolinks:load', ()=> {
  $(function() {
    $(".category-style-0, .category-style-1").click(function () {
        var i = $(".category-style-0, .category-style-1").index(this)
        var p = $(".bbb").eq(i).offset().top;
        var speed = 500;
        $('html,body').animate({ scrollTop: p },speed,);
        return false;
    });

    $(".btn_top").click(function () {
        $('html,body').animate({ scrollTop: 0 }, 'fast');
        return false;
    });
  });
});