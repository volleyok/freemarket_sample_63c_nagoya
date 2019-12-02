$(document).on('turbolinks:load', ()=> {
  var images = [];
  var buildFileField = (post)=> {
    console.log(buildFileField)
    var html = `<div data-index="${post}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product_images[image][][${post}][src]"
                    id="image_${post}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
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
          var buildFileField = (post);
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
});

