jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/6/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_6") != null){
      console.log("jQuery練習用スクリプト6が稼働しています");
      function UseMagic(id , animation , time){
        const $object  = $(`#${id}`);
        $object.removeClass(`magictime ${animation}`);
        setTimeout(function(){
          $object.addClass(`magictime ${animation}`)
        },time)
      }

      $(".puff_in_button").on("click" , function(){
        UseMagic("magic_test_1" , "puffIn" , "0")
      })

      $(".open_down_left").on("click" , function(){
        UseMagic("magic_test_2" , "openDownLeft" , "0")
      })

      $(".slide_down").on("click" , function(){
        UseMagic("magic_test_3" , "slideDown" , "0")
      })

      $(".boing_in_up").on("click" , function(){
        UseMagic("magic_test_4" , "boingInUp" , "0")
      })
      // UseMagic(".")
    }
  }
})