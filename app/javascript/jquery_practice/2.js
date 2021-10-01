jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/2/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_2") != null){
      console.log("jQuery練習用スクリプト2が稼働しています")
      function findFirst(){
        $(".jquery_practice_class1:first").css("font-weight" , "bold");
        $(".jquery_practice_class1:first-child").css("color" , "blue");
        $("#jquery_practice_id_3 > span").text("要素１と要素４が青文字になり、要素１のみが太文字になる").css("display" , "block");
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
        $("#use_background_1").css("background-color" , "gray");
        objects.css("width" , "25%").css("text-align" , "center").css("display" , "inline-block").css("padding" , "5px auto").css("margin" , "2px auto");
        $(".jquery_practice_class2:nth-child(even)").css("background-color" , "#fcffdb");
        $(".jquery_practice_class2:nth-child(odd)").css("background-color" , "#4560ff").css("color" , "white");
        $(".jquery_practice_class2:nth-child(3n)").css("border" , "2px solid black");
        $(".jquery_practice_class2:nth-child(3n+1)").css("border" , "2px solid green");
        $(".jquery_practice_class2:nth-child(1)").css("border" , "2px solid red");
        $(".nth_child_explain:eq(1)").text("要素１に赤い境界線がついている");
        $(".nth_child_explain:eq(2)").text("偶数番目の背景色が薄い黄色になっている");
        $(".nth_child_explain:eq(3)").text("奇数番目の背景が青くなっている");
        $(".nth_child_explain:eq(4)").text("3の倍数番目に黒い境界線がついている");
        $(".nth_child_explain:eq(5)").text("3で割った時1で余る番目に緑の境界線がついている");
        $(".nth_child_explain").css("display" , "block");
      }
      useNthChild();
    
      function useOdd(){
        $(".jquery_practice_class4:odd").css("font-weight" , "bold").css("color" , "purple").css("width" , "25%").css("text-align" , "center").css("margin", "3px auto");
        $(".jquery_practice_class4:even").css("font-weight" , "bold").css("color" , "red").css("width" , "25%").css("text-align" , "center").css("margin", "3px auto");
        $("#jquery_practice_id_2 ~ span").text("偶数番目の文字が赤色になり、奇数番目の文字が紫色になる");
      }
      useOdd();
    
      function useEqLtGt(){
        $(".jquery_practice_class5:eq(0)").css("font-weight" , "bold");
        $(".jquery_practice_class5:gt(3)").css("background-color" , "#e8abff");
        $(".jquery_practice_class5:lt(5)").css("border" , "2px solid blue");
        $(".jquery_practice_class5").css("width" , "25%").css("margin" , "3px auto");
        $(".eq_explain_span:nth-child(4)").text("１番目の文字が太くなっている");
        $(".eq_explain_span:nth-child(2)").text("４番より後の文字に紫の背景がついている");
        $(".eq_explain_span:nth-child(3)").text("６番より前の文字に青い境界線がついている");
        $(".eq_explain_span").css("display" , "block");
      }
      useEqLtGt();
    }
  }

})