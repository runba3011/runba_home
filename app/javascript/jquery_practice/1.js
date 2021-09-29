import { $ } from "@rails/ujs";

function test1(){
  if(document.URL.match(/skill_room/) && document.URL.match(/jquery_practice/)){
    console.log("スクリプトを使用します");
    $(document).ready(function(){
      // jqueryの導入ができていることのテスト
      $("#jquery_test").text("jQuery稼働テスト（成功！）");

      $("#jquery_id_get").text("ID取得テスト（成功！）");
      $("section").text("要素名取得テスト（成功！）");
    })
  }
}

window.addEventListener("load" , test1)