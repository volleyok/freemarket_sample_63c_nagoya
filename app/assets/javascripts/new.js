$(document).on('turbolinks:load', ()=> {
  var images = [];
  $(function(){
    $('form').on('change', 'input[type="file"]','#image' ,function(e) {
      var file = e.target.files[0],
      reader = new FileReader(),
      $preview = $(".preview");
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
      if(image.length >= 6)
      var pick_image2 = image.slice(5)
      $.each(pick_image2,function(index,image){
        image.date('image',index + 5);
        preview2.append('<img>');
      })
      var new_image = $(`<input multiple= "multiple" name="product_images[image][]"  type="file" id="image" image =${images.length} style = display:none>`);
      $(".image_box").prepend(new_image);
    });
  });
});

