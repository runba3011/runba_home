jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/6/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_6") != null){
      console.log("jQuery練習用スクリプト6が稼働しています");
      $(".magic_test_1").addClass('magictime puffIn');
    }
  }
})