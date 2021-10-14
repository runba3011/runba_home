jQuery(function($){
  if(document.URL.match(/users/)){
    const $topImage = $(".top_image");
    if($topImage.length >= 1){
      console.log("ユーザー詳細、編集画面で背景画像の高さの調整を行います");
      function adjustHeight(){
        $topImage.css("height" , `${$topImage.width() / 16 * 6}px`);
      }

      adjustHeight();
      $(window).resize(function(){
        adjustHeight();
      });
      
    }
  }
})