$(document).on('turbolinks:load', function() {
    $(function() {
        $('img.post_show_photos').mouseover(function() {
            console.log('ok')
            var selectedSrc = $(this).attr('src');
            $('img.mainImage').stop().fadeOut(230,
                function() {
                    $('img.mainImage').attr('src', selectedSrc);
                    $('img.mainImage').stop().fadeIn(230);
                }
            );
        });
    });
});