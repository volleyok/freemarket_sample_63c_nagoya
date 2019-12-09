$(document).on('turbolinks:load', () => {
    var images = [];
    $(function() {
        $('form').on('change', 'input[type="file"]', '#image', function(e) {
            var file = e.target.files[0],
                reader = new FileReader(),
                $preview = $(".preview");
            $preview2 = $(".preview2");
            t = this;
            if (file.type.indexOf("image") < 0) {
                return false;
            }
            reader.onload = (function(file) {
                return function(e) {
                    $preview.append($('<img>').attr({
                        src: e.target.result,
                        width: "110px",
                        height: "110px",
                        class: "preview",
                        title: file.name
                    }));
                };
            })(file);
            reader.readAsDataURL(file);
            images.push('<img>');
            var new_image = $(`<input multiple= "multiple" name="product_images[image][]"  type="file" id="image" image =${images.length} style = display:none>`);
            $(".image_box").prepend(new_image);
        });
        $('#post_images_attributes_0_image_url').on('change', function() {
            $('#post_images_attributes_0_image_url').css('display', 'none');
            $('#post_images_attributes_0_image_url').css('display', 'none');
            $('#post_images_attributes_1_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_1_image_url').on('change', function() {
            $('#post_images_attributes_1_image_url').css('display', 'none');
            $('#post_images_attributes_2_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_2_image_url').on('change', function() {
            $('#post_images_attributes_2_image_url').css('display', 'none');
            $('#post_images_attributes_3_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_3_image_url').on('change', function() {
            $('#post_images_attributes_3_image_url').css('display', 'none');
            $('#post_images_attributes_4_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_4_image_url').on('change', function() {
            $('#post_images_attributes_4_image_url').css('display', 'none');
            $('#post_images_attributes_5_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
            $('.image_box_main').css('display', 'block');

        });
        $('#post_images_attributes_5_image_url').on('change', function() {
            $('#post_images_attributes_5_image_url').css('display', 'none');
            $('#post_images_attributes_6_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
            // $('.preview').css('display', 'block');

        });
        $('#post_images_attributes_6_image_url').on('change', function() {
            $('#post_images_attributes_6_image_url').css('display', 'none');
            $('#post_images_attributes_7_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_7_image_url').on('change', function() {
            $('#post_images_attributes_7_image_url').css('display', 'none');
            $('#post_images_attributes_8_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_8_image_url').on('change', function() {
            $('#post_images_attributes_8_image_url').css('display', 'none');
            $('#post_images_attributes_9_image_url').css({
                'display': 'block',
                'width': '100%',
                'background': '#f5f5f5',
                'border': '1px dashed #ccc',
                'min-height': '162px',
                'text-align': 'center',
            });
        });
        $('#post_images_attributes_9_image_url').on('change', function() {
            $('#post_images_attributes_9_image_url').css('display', 'none');
        });

    });



    $(function() {
        $("#post_price").on('input', function() {
            var data = $("#post_price").val();
            var profit = Math.round(data * 0.9);
            var fee = (data - profit);
            console.log(profit)
            $('.right_task').html(fee);
            $('.right_task').prepend('¥');
            $('.right_profit').html(profit);
            $('.right_profit').prepend('¥');
            $('#price').val(profit);
            if (profit == '') {
                $('.right_profit').html('');
                $('.right_task').html('');
            }
        });
    });
});