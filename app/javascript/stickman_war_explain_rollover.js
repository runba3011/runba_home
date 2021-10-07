jQuery(function($){
  if(document.URL.match(/stickman_war/)){
    const $openButtons =  $("._stickman_war_explain_parent");
    if($openButtons.length != 0){
      $openButtons.rollover();
    }
  }
})