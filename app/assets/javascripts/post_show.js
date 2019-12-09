$(document).on('turbolinks:load', function() {
    $(function() {
        $('.post_show_photos').mouseover(function() {
            console.log('ok')
            var selectedSrc = $('.post_show_photos_main').attr('src')
                //     $('.post_show_photos').stop().fadeOut(230,
                //         function() {
                //             $('.post_show_photos').attr('src', selectedSrc);
                //             $('.post_show_photos').stop().fadeIn(230);
                //         }
                //     );
                // });
                // $('.post_show_photo_main').mouseout(function() {
                //     $(this).css({ 'border': '' });
        });
    });
});