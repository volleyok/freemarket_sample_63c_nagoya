$(document).on('turbolinks:load', ()=> {
  var images = [];
  $(function(){
    $('form').on('change', 'input[type="file"]','#image' ,function(e) {
      var file = e.target.files[0],
      reader = new FileReader(),
      $preview = $(".preview");
      $preview2 = $(".preview2");
      t = this;
      if(file.type.indexOf("image") < 0){
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