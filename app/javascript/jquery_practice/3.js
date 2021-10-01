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

    function attrTest(){
      const link = $("#root_link_text").attr("href");
      $(".show_url").text("↑は"+link+"に飛ぶリンクです");
      $(".css_test").attr("style" , "background-color:black;color:white;display:inline-block;padding:5px 10px;border-radius:5px;").text("このテキストの背景はattrメソッドで変更しました");
      $(".no_link_a").attr({href: "/" , style:"background-color:blue;color:white;display:inline-block;padding:5px 10px;border-radius:5px;text-decoration:none;"}).text("リンクやスタイルの設定が終わりました");
      $(".styled_p").removeAttr("style").text("このテキストは赤かったものの、スクリプトによって黒くなった");
      // debugger;
    }
    attrTest();

    function attrFunctionTest(){
      $(".attr_function_test").text("要素").attr("title" , function(index , attr){
        return(`${attr}${index+1}`);
      });
      $("#attr_function_test_parent ~ span").text("「要素」のうえに真数カーソルが乗った時に出てくるものを変えたものの今はパソコンを使っている人よりもスマホを使ってる人の方が多いから分からないのがちょっと悲しい")
    }
    attrFunctionTest();

    function checkHasClass($object){
      if ($object.hasClass("test_class")){
        return "このテキストにはtest_classが入っています"
      }
      else{
        return "このテキストにはtest_classが入っていません"
      }
    }

    function classMethodTest(){
      $(".class_method_test_toggle").css("width" , "20%").css("height" , "50px");
      $(".no_background_red1").addClass("background_red").text("スクリプトによってクラスが追加、背景が赤くなった");
      $(".has_background_red1").removeClass("background_red").text("スクリプトによってクラスが削除、背景が無くなった");
      $(".class_method_has1").text(checkHasClass($(".class_method_has1")));
      $(".class_method_has2").text(checkHasClass($(".class_method_has2")));
    }
    classMethodTest();

    $("#delete_text_button").on("click" , function(){
      $(".class_method_test_toggle").text("");
    })

    $("#color_change_button").on("click" , function(){
      $(".class_method_test_toggle").toggleClass("background_red");
    })

    function getElement(elementName){
      return `↑このオブジェクトの${elementName}は`+$(".css_method_test").css(elementName)+"です";
    }

    function cssMethodTest(){
      $object =$(".css_method_test");
      $object.css({
        "font-size": "20px",
        "background-color":"yellow",
        "border-radius": "5px",
        "display":"inline-block",
        "font-weight":"bold"
      });
      $(".font_size_show").text(getElement("font-size"));
    }
    cssMethodTest();

    function widthHeightTest(){
      $complicatedObject = $(".width_height_test");
      $(".complicated_width_height1").text("上のテキストのwidthは"+$complicatedObject.width()+"です");
      $(".complicated_width_height2").text("上のテキストのheightは"+$complicatedObject.height()+"です");

      $(".complicated_width_height3").text("上のテキストのpaddingを含んだwidthは"+$complicatedObject.innerWidth()+"です");
      $(".complicated_width_height4").text("上のテキストのpaddingを含んだheightは"+$complicatedObject.innerHeight()+"です");

      $(".complicated_width_height5").text("上のテキストのpaddingとborderを含んだwidthは"+$complicatedObject.outerWidth()+"です");
      $(".complicated_width_height6").text("上のテキストのpaddingとborderを含んだheightは"+$complicatedObject.outerHeight()+"です");

      $(".complicated_width_height7").text("上のテキストの全てを含んだwidthは"+$complicatedObject.outerWidth(true)+"です");
      $(".complicated_width_height8").text("上のテキストの全てを含んだheightは"+$complicatedObject.outerHeight(true)+"です");
    }
    widthHeightTest();

    function scrollTest(){
      $("#scroll_test_button").on("click" , function(){
        $(window).scrollTop(0);
      })

      $("#move_to_scroll_button").on("click" , function(){
        $(window).scrollTop(2221);
      })
    }
    scrollTest();
  }
})