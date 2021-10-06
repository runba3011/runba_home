jQuery(function($){
  if(document.URL.match(/stickman_war_detail/)){
    const $hideParent = $("#strategy_parent");
    if($hideParent != null){
      console.log("ネタバレ防止スクリプト");
      $openButton = $(".open_strategy_button");
      $openButton.on("click" , function(){
        $hideParent.slideToggle();
        this.setAttribute("style" , "display:none;");
      })
    }
  }
})