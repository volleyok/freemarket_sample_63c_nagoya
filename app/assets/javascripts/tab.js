$(document).on('turbolinks:load', function() {

  $(function() {
  
    // ①タブをクリックしたら発動
    $('.content__menu li').click(function() {
  
      // ②クリックされたタブの順番を変数に格納
      var index = $('.content__menu li').index(this);
  
      // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
      $('.content__menu li').removeClass('active');
  
      // ④クリックされたタブにクリック済みデザインを適用する
      $(this).addClass('active');
  
      // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
      $('.content__box2 ul').removeClass('content__lists').eq(index).addClass('content__lists');
  
    });
  });
});


$(document).on('turbolinks:load', function() {

  $(function() {
  
    // ①タブをクリックしたら発動
    $('.content__menu_type2 li').click(function() {
  
      // ②クリックされたタブの順番を変数に格納
      var index = $('.content__menu_type2 li').index(this);
  
      // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
      $('.content__menu_type2 li').removeClass('active');
  
      // ④クリックされたタブにクリック済みデザインを適用する
      $(this).addClass('active');
  
      // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
      $('.content__box4 ul').removeClass('content__lists_type2').eq(index).addClass('content__lists_type2');
  
    });
  });
});