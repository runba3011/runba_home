jQuery(function($){
  if(document.URL.match(/stickman_war_detail/)){
    // ボスの情報と、攻略情報の部分を隠すためのスクリプト
    const $strategyHideParent = $("#strategy_parent");
    const $bossOpenButton = $(".open_boss_button")
    const toggleTime = 400;

    function hideOpenButton($object){
      $object.animate({opacity: 0} , toggleTime / 3);
      $object.wrap($("<div></div>"))
      $object.parent().animate({height:0} , toggleTime / 3 + 50);
    }

    if($strategyHideParent != null){
      // ボスの情報の部分
      $bossOpenButton.on("click" , function(){
        const $toggleObject = $("#boss_detail_parent")
        $toggleObject.slideToggle(toggleTime);
        hideOpenButton($bossOpenButton);
      })

      // 攻略情報の部分
      const $openButton = $(".open_strategy_button");
      $openButton.on("click" , function(){
        $strategyHideParent.slideToggle();
        hideOpenButton($openButton);
      })
    }
  }
})