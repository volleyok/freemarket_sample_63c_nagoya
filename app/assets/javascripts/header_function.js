$(document).on('turbolinks:load', function() {
    $(function() {
        $('.left-contents li').hover(function() {
            $(".category-lists:not(:animated)", this).slideToggle(0);
            $(".brand-lists:not(:animated)", this).slideToggle(0);
        });
    });
    $(function() {
        $('.category-lists-ladies >li').hover(function() {
            $(".category-lists2 (:animated)", this).slideToggle(0);


            $(".brand-lists:not(:animated)", this).slideToggle(0);
        });
    });
});