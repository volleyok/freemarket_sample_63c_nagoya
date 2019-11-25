$(function() {
    $('.left-contents li').hover(function() {
        $(".category-lists:not(:animated)", this).slideToggle(0);
        $(".brand-lists:not(:animated)", this).slideToggle(0);
    });

    // $('.ladies').hover(function() {
    //     console.log('ok')
    //         $(".ladies-lists", this).animate({ width: 'toggle' }, 0);

    // });




});