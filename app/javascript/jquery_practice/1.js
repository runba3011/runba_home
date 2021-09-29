function test1(){
  if(document.URL.match(/skill_room/) && document.URL.match(/jquery_practice/)){
    console.log("スクリプトを使用します");
    $(document).ready(function(){
      $("p").text("jQueryテスト（稼働中）")
    })
  }
}

window.addEventListener("load" , test1)