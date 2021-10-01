jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/5/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_5") != null){
      console.log("jQuery練習用スクリプト5が稼働しています");

      function appendTest(){
        console.log("関数");
      }

      $("#append_test_button").click(function(){
        appendTest();
      });
    }
  }
})