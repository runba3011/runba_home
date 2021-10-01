jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/4/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_4") != null){
      console.log("jQuery練習用スクリプト4が稼働しています");

      function htmlTextTest(){
        $(".html_text_test:nth-child(1)").html("<span style = 'color:red;'>htmlメソッドで赤いテキスト</span>");
        $(".html_text_test:nth-child(2)").text("<span style = 'color:red;'>textメソッドではそのまま出てくる</span>");
      }
      htmlTextTest();

      $("#val_test_input_button").on("click" , function(){
        alert(`「${$("#val_test_input").val()}」と入力されました`);
      } );

      $("#val_test_select").change(function(){
        alert(`${$("#val_test_select option:selected").text()}(${$("#val_test_select").val()})が選択されました`);
      } );

      $("input[type=text]").on("input",function(){
        $("#show_name").text(`君の名前は${$("input[type=text]").val()}なんだね！`);
      });

      $(".gender_button").change(function(){
        console.log("選択")
        text = $(".gender_button:checked").parent().text();
        $("#show_gender").text(`君は${text}なんだね！`);
      })

      $("#yabai_button").on("click" , function(){
        if($("#show_gender").text() != "" && $("#show_name").text() != ""){
          function makeYouTouhokuKiritan(){
            console.log("不正な処理を行います");
            $("input[type=text]").val("東北きりたん");
            $("#show_name").text("お前は東北きりたんになるんだよ！");
            $("input[type=radio]:eq(1)").removeAttr("disabled").prop("checked" , true);
            $("#show_gender").text("お前は女の子になるんだよ！");
            $("input[type=checkbox]").removeAttr("disabled").prop("checked" , true);
            $("#show_confirm").text("何に同意するのかをみせることなくチェックを入れさせることもできるんだ！")
            $("#notice").text("こうやって不正に情報を変えられる場合もあるから気をつけよう！");
          }
          if(confirm("東北きりたんになりますか？")){
            makeYouTouhokuKiritan();
          }
          else{
            makeYouTouhokuKiritan();
          }
        }
        else{
          alert("先に名前や性別を入力しよう！");
        }
      })
    }
  }
})