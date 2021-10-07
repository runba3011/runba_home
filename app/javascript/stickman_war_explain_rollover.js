jQuery(function($){
  if(document.URL.match(/stickman_war/)){
    const $openObjects =  $("._stickman_war_explain_parent");
    const $openButtons = $(".show_button")
    let openingObjectNumber = 0;
    const speed = 500;
    if($openButtons.index() != -1){
      console.log($openObjects.index())
      // デフォルトではopenObjectsの全てにdisplay:none;がついているため、１つ目のみ開いておく
      $openObjects.eq(0).css("display" , "inherit")

      function pushedButtonColor(){
        $openButtons.css("background" , "white").css("color" , "black");
        $openButtons.eq(openingObjectNumber).css("background" , "radial-gradient( transparent 60%, black 120%) , gray").css("color" , "white");
      }
      pushedButtonColor();

      function selectFunction($this){
        const openNumber = $openButtons.index($this);
        console.log(openNumber);

        if(openingObjectNumber != openNumber){
          const $closeObject = $openObjects.eq(openingObjectNumber);
          $closeObject.slideUp(speed , "swing");
          const $openObject = $openObjects.eq(openNumber);
          $openObject.slideDown(speed , "swing");
          openingObjectNumber = openNumber;
          pushedButtonColor();
        }
      }

      $openButtons.on("click" , function(){
        selectFunction($(this));
      })
    }
  }
})