$(document).on('turbolinks:load', ()=> {
  var images = [];
  $(function(){
    $('form').on('change', 'input[type="file"]','#image' ,function(e) {
      var file = e.target.files[0],
      reader   = new FileReader(),
      $preview = $(".preview"),
      // 動的にIDを取得する記述
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
        if(file.type.indexOf("image") < 0){
          return false;
        }
        reader.onload = (function(file) {
          return function(e) {
            $preview.append(btn_wrapper);
            // セレクタを動的に変化させる（上記IDになるようにする）
            $(`#btnimages`).prepend($('<img>').attr({
              src: e.target.result,
              width: 100,
              height: 100,
            }));
          };
        })(file);
      reader.readAsDataURL(file);
      images.push('<img>');
      var new_image = $(`<input accepts_nested_attributes_for= "accepts_nested_attributes_for" name="product_images[image][]"  type="file" id="image" image =${images.length} style = display:none>`);
      $(".image_box").prepend(new_image);
    });
    $('.preview').on('click','.new-btn-delete',function(){
      $(this)
        .parent()
        .remove()
    });
  });
  



  $(function() {
    $("#post_price").on('input', function(){ 
      var data = $("#post_price").val();
      var profit = Math.round(data * 0.9);
      var fee = (data - profit);
      console.log(profit)
      $('.right_task').html(fee);
      $('.right_task').prepend('¥');
      $('.right_profit').html(profit);
      $('.right_profit').prepend('¥');
      $('#price').val(profit);
      if(profit == '') { 
      $('.right_profit').html('');
      $('.right_task').html('');
      }
    });
  });
});