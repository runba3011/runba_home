jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/5/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_5") != null){
      console.log("jQuery練習用スクリプト5が稼働しています");

      $("input[type=button]").css({"display":"block" , "margin":"3px"});

      $(".append_test").css("width" , "33.3333%");
      let isAppendFinished = false;
      function appendTest(object){
        if(!isAppendFinished){
          console.log("関数");
          const $object = $(".append_test_parent");
          $object.before($("<p>ボックスの前に追加</p>"));
          $object.after($("<p>ボックスの後に追加</p>"));
          $object.prepend($("<p class= 'append_test'>ボックスの最初に追加</p>"));
          $object.append($("<p class = 'append_test'>ボックスの最後に追加</p>"));
          $(".append_test").css({"width":"33.3333%" , "font-size":"14px" , "text-align":"center"});
          isAppendFinished = true;
          object.value = ("使うにはページを読み込み直してください");
        }
      }

      $("#append_test_button").click(function(){
        appendTest(this);
      });


      $wrapObject = $(".wrap_test");
      function wrapTest(){
        $wrapObject.wrap("<div style='border:1px solid gray;margin:2px;'></div>")
      }

      function wrapAllTest(){
        $wrapObject.wrapAll("<div style='border:1px solid pink;margin:2px;'></div>")
      }

      let wrapInnerCount = 0;
      function wrapInnerTest(){
        if(wrapInnerCount % 2 == 0){
          $(".wrap_inner_test").wrapInner("<div style = 'background-color:rgb(255, 254, 194 , 0.5);padding:2px;'></div>")
        }
        else{
          $(".wrap_inner_test").wrapInner("<div style = 'background-color:rgb(255, 0, 247 , 0.1);padding:2px;'></div>")
        }
        wrapInnerCount ++;
        
      }

      function unwrapTest(){
        $wrapObject.unwrap();
      }

      function replaceWithTest(){
        $(".replace_with_test").replaceWith("<strong class='replace_with_test' style='display:block;'>replaceWithを使用</strong>");
      }

      function replaceAllTest(){
        $("<p class='replace_with_test'>replaceAllを使用/p>").replaceAll(".replace_with_test")
      }
      
      $("#use_wrap_button").on("click" , function(){
        wrapTest();
      })
      
      $("#use_wrap_all_button").on("click" , function(){
        wrapAllTest();
      })

      $("#use_wrap_inner_button").on("click" , function(){
        wrapInnerTest();
      })

      $("#use_unwrap_button").on("click" , function(){
        unwrapTest();
      })

      $("#use_replace_with_button").on("click" , function(){
        replaceWithTest();
      })

      $("#use_replace_all_button").on("click" , function(){
        replaceAllTest();
      })

      function setEmptyRemoveTestWidth(){
        $(".empty_remove_test").css({"width":"25%" , "text-align":"center"});
      }

      function resetEmpty(){
        $(".empty_remove_test").text(function(index){
          return `要素${index+1}`
        })
      }

      $("#use_reset_empty_button").on("click" , function(){
        resetEmpty();
        setEmptyRemoveTestWidth();
      })

      function emptyTest(){
        $(".empty_remove_test").empty();
      }

      $("#use_empty_button").on("click" , function(){
        emptyTest();
        setEmptyRemoveTestWidth();
      })

      function removeTest(){
        $(".empty_remove_test").remove();
      }

      $("#use_remove_button").on("click" , function(){
        removeTest();
        setEmptyRemoveTestWidth();
      })

      let $cloneObject = $(".empty_remove_test").clone();
      function cloneTest(){
        $cloneObject = $(".empty_remove_test").clone();
        $cloneObject.prependTo($(".empty_remove_test_parent"));
      }

      $("#use_clone_button").on("click" , function(){
        cloneTest();
        setEmptyRemoveTestWidth();
      })
    }
  }
})