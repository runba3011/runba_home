jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/2/) && document.URL.match(/jquery_practice/)){
    console.log("jQuery練習用スクリプト2が稼働しています")
  }

  function findFirst(){
    $(".jquery_practice_class1:first").css("font-weight" , "bold");
    $(".jquery_practice_class1:first-child").css("color" , "blue");
    $(".jquery_practice_detail > span").text("要素１と要素４が青文字になり、要素１のみが太文字になる").css("display" , "block");
  }
  findFirst();

  function findLast(){
    $(".jquery_practice_class1:last-child").css("border" , "1px dotted pink").css("margin" , "3px auto");
    $(".jquery_practice_class1:last").css("border-bottom" , "3px solid red");
    $("div .message2").text("要素３と要素６にピンクの境界線がつき、要素６には赤い下線がつく").css("display" , "block");
  }
  findLast();

  function useOnlyChild(){
    $(".jquery_practice_class3:only-child").css("color" , "blue");
    $("#jquery_practice_id_1 ~ span").text("要素２のみが青文字になる");
  }

  useOnlyChild();

  function useNthChild(){
    const objects = $(".jquery_practice_class2");
    objects.css("width" , "25%").css("text-align" , "center").css("display" , "inline-block").css("margin" , "5px auto");
  }
  useNthChild();
})