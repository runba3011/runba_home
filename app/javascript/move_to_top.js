jQuery(function($){
  if(document.URL.match(/top/) && document.URL.match(/detail/)){
    const $moveButton = $(".move_to_top_button");
    if($moveButton.length != 0){
      console.log("一番上へ移動するやつ");
      $moveButton.on("click" , function(){
        $("body , html").animate({scrollTop:0} , $(window).scrollTop() / 10);
      })
    }
  }
})