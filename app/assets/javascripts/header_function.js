$(document).on('turbolinks:load', function() {
    $(function() {
        $('.left-contents li').hover(function() {
            $(".category-lists:not(:animated)", this).slideToggle(0);
            $(".brand-lists:not(:animated)", this).slideToggle(0);
        });
    });
});