jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/3/) && document.URL.match(/jquery_practice/)){
    console.log("jQuery練習用スクリプト3が稼働しています")
    function containHasTest(){
      $(".contain_has_test").css("width" , "25%").css("padding" , "5px 20px");
      $(".contain_has_test:contains('東北')").css("background-color" , "#ffd8a3");
      $(".contain_has_test:has(span)").css("background-color" , "#d1cfff");
      $("#contain_has_test_parent ~ .contain_has_parent_explain1").text("「東北」を含む背景がオレンジになっています").css("display" , "block");
      $("#contain_has_test_parent ~ .contain_has_parent_explain2").text("<span>のある、結月ゆかり、弦巻まき、京町せいか、琴葉あおいの背景が青くなっています");
    }
    containHasTest();

    function emptyParentTest(){
      $(".empty_parent_test").css("width" , "33.33333333%").css("height" , "30px").css("display" , "inline-block").css("text-align" , "center");
      $(".empty_parent_test:empty").css("background-color" , "gray");
      $(".empty_parent_test:parent").css("background-color" , "yellow");
      $(".empty_parent_test_explain:eq(0)").text("「要素」などの文字列が入っているところの背景は黄色に").css("display" , "block");
      $(".empty_parent_test_explain:eq(1)").text("入っていないところはグレーになっている").css("display" , "block");
    }
    emptyParentTest();
  }
})