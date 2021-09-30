import { $ } from "@rails/ujs";

function test1(){
  if(document.URL.match(/skill_room/) && document.URL.match(/jquery_practice/)){
    console.log(`スクリプトを使用します`);
    jQuery(function($){
      // jqueryの導入ができていることのテスト
      function setText(text){
          console.log(`関数の呼び出しに成功しました`);
          $(`#jquery_test`).text(`jQuery稼働テスト（成功！）`);

          $(`#jquery_id_get`).text(`ID取得テスト（${text}）`);
          $(`section`).text(`要素名取得テスト（${text}）`);
          // debugger;
          $(`.jquery_class_get`).text(`クラス取得テスト(${text})`);
          $(`a[href$='_practice/1']`).text(`URL取得テスト（${text}）`);
      }
      $(setText("成功！"));
      $(setText("関数からの呼び出しに成功！"));

      function addHTML(html){
        $(`${html}`).appendTo("#family");
      }
      addHTML("<li>新しい要素だよ！</li>");

      function substitutionTest(afterSubstitution){
        const rootObject = $("#jquery_root_object");
        rootObject.text(afterSubstitution);
      }
      substitutionTest("一度別の変数に代入してから、中身を変えることに成功！");

      function useMethodChain(top , right , bottom , left){
        $("#jquery_method_chain").css("border" , "5px solid red").css("padding" , "10px").css("border-top-color" , top).css("border-right-color" , right ).css("border-bottom-color" , bottom).css("border-left-color" , left);
      }
      useMethodChain("#ff0000" , "#fe00ff" , "#6500ff" , "#001aff" );

      function useAttributeSelector(){
        $("a[target='_self']").css("color" , "red").css("text-decoration" , "none");
        $("a[target='_blank']").css("color" , "blue").css("text-decoration" , "none");
        $("#inform_able_1").text("このテキストが表示されているなら、正しく変更をすることができています");
      }
      useAttributeSelector();

      function getAllChild(){
        $(".jquery_div_parent1 p").css("color" , "purple");
      }
      getAllChild();

      function getDirectChild(){
        $(".jquery_div_parent2 > p").css("color" , "green");
      }
      getDirectChild();

      function directSiblingPositionSet(){
        $(".jquery_practice_parent3").css("margin-top" , "10px").css("border" , "1px dotted gray").css("display" , "flex").css("justify-content" , "space-between");
        $(".jquery_practice_parent3 p").css("padding-right" , "5px");
      }
      directSiblingPositionSet();

      function getDirectSibling(){
        $(".jquery_practice_sibling1 + p").css("font-weight" , "bold");
      }
      getDirectSibling();
      
      function getAllSibling(){
        $(".jquery_practice_sibling1 ~ p").css("color" , "red");
      }
      getAllSibling();

      function informFinishedGetSibling(){
        $(".jquery_practice_detail > .sibling_span").css("margin-top" , "10px").css("display" , "inline-block").text("正しく兄弟セレクターの取得ができました、兄オブジェクトのすぐ横が太文字になり、それ以外は赤くなっている");
      }

      informFinishedGetSibling();

    })
  }
}

jQuery(test1);