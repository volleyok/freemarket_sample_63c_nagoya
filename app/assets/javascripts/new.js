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
            width: "150px",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.onload =(function(e){
        var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
        $preview.append($(btn_wrapper).attr({

        }));
      });
      reader.readAsDataURL(file);
      images.push('<img>');
      var new_image = $(`<input multiple= "multiple" name="product_images[image][]"  type="file" id="image" image =${images.length} style = display:none>`);
      $(".image_box").prepend(new_image);
    });
    // $(document).on('click', '.delete',".preview",function() {
    //   var file = e.target.files[0],
    //   reader = new FileReader(),
    //   t = this;
      
      
        
      
    // });
  });
});

// 参考記事
// $(document).on('turbolinks:load', ()=> {
//   // 画像用のinputを生成する関数
//   const buildFileField = (index)=> {
//     const html = `<div data-index="${index}" class="js-file_group">
//                     <input class="js-file" type="file"
//                     name="product[images_attributes][${index}][src]"
//                     id="#image${index}"><br>
//                     <div class="js-remove">削除</div>
//                   </div>`;
//     return html;
//   }

//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];

//   $('form').on('change', 'input[type="file"]','#image', function(e) {
//     // fileIndexの先頭の数字を使ってinputを作る
//     $('.image-box').append(buildFileField(fileIndex[0]));
//     fileIndex.shift();
//     // 末尾の数に1足した数を追加する
//     fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//   });

//   $('form').on('click', '.js-remove', function() {
//     $(this).parent().remove();
//     // 画像入力欄が0個にならないようにしておく
//     if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//   });
// });




