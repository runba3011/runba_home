function test1(){
  if(document.URL.match(/skill_room/) && document.URL.match(/jquery_practice/)){
    console.log(`スクリプトを使用します`);
    $(document).ready(function(){
      // jqueryの導入ができていることのテスト
      function setText(text){
        console.log(`関数の呼び出しに成功しました`);
        $(`#jquery_test`).text(`jQuery稼働テスト（${text}）`);

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
      $(addHTML("<li>新しい要素だよ！</li>"));
    })
  }
}

jQuery(test1);