$(document).on('turbolinks:load', () => {
    var images = [];
    // console.log(images)
    $(function() {
      $('form').on('change', 'input[type="file"]', '#image', function(e) {
        var file = $(this).prop("files")[0],
        reader = new FileReader(),
                $preview = $(".preview"),
                btn_wrapper = $(
                  // 動的にIDを振る
                  `<div class="btnimage" id ="btnimages">
                    <div class="new-btn-edit">
                    編集
                    </div>
                    <div class="new-btn-delete">
                    削除
                    </div>
                  </div>`
                  )
            t = this;
            reader.onload = (function(file) {
                return function(e) {
                  //  var image_item = `< div class ="aaa"></div>`
                  //  ('.preview').append(image_item)
                  //  image_item.append(btn_wrapper)
                  $preview.append(btn_wrapper)
                  $('.btnimage').prepend($('<img>').attr({
                    src: e.target.result,
                    width: "110px", 
                    height: "110px",
                    class: "preview_image",
                    title: file.name
                  }));
                   
                  
                };
            })(file);
            reader.readAsDataURL(file);
            images.push('<img>');
            var new_image = $(`<input accepts_nested_attributes_for= "accepts_nested_attributes_for"  name="product_images[image][]"  type="file" id="image" image =${images.length} style = display:none>`);
            $(".image_box").prepend(new_image);
        });
        // $('#post_images_attributes_0_image_url').on('change', function() {
        //     $('#post_images_attributes_0_image_url').css('display', 'none');
        //     $('#post_images_attributes_1_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_1_image_url').on('change', function() {
        //     $('#post_images_attributes_1_image_url').css('display', 'none');
        //     $('#post_images_attributes_2_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_2_image_url').on('change', function() {
        //     $('#post_images_attributes_2_image_url').css('display', 'none');
        //     $('#post_images_attributes_3_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_3_image_url').on('change', function() {
        //     $('#post_images_attributes_3_image_url').css('display', 'none');
        //     $('#post_images_attributes_4_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_4_image_url').on('change', function() {
        //     $('#post_images_attributes_4_image_url').css('display', 'none');
        //     $('#post_images_attributes_5_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_5_image_url').on('change', function() {
        //     $('#post_images_attributes_5_image_url').css('display', 'none');
        //     $('#post_images_attributes_6_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_6_image_url').on('change', function() {
        //     $('#post_images_attributes_6_image_url').css('display', 'none');
        //     $('#post_images_attributes_7_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_7_image_url').on('change', function() {
        //     $('#post_images_attributes_7_image_url').css('display', 'none');
        //     $('#post_images_attributes_8_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_8_image_url').on('change', function() {
        //     $('#post_images_attributes_8_image_url').css('display', 'none');
        //     $('#post_images_attributes_9_image_url').css('display', 'block');
        // });
        // $('#post_images_attributes_9_image_url').on('change', function() {
        //     $('#post_images_attributes_9_image_url').css('display', 'none');
        // });
        $('.preview').on('click','.new-btn-delete',function(){
          $(this)
            .parent()
            .remove()
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