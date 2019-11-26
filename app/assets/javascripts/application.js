// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  $('form').on('change', 'input[type="file"]','#image' ,function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $("#preview");
        t = this;
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);
    reader.readAsDataURL(file);
    var new_image = $(`<input multiple= "multiple" name="product_images[image][]"  type="file" id="image">`);
    $(".image_box").prepend(new_image);
  });
  // $(document).on('change','#image',function(e){
    
  //   $(".image_box").children(":first").css({'display':'block'});
  //   $(this).css({'display':'none'});
  // });
});