jQuery(function($){
  if(document.URL.match(/skill_room/) && document.URL.match(/6/) && document.URL.match(/jquery_practice/)){
    if(document.getElementById("jquery_practice_6") != null){
      console.log("jQuery練習用スクリプト6が稼働しています");
      function UseMagic(id , animation , time){
        const $object  = $(`#${id}`);
        $object.removeClass(`magictime ${animation}`);
        setTimeout(function(){
          $object.addClass(`magictime ${animation}`)
        },time)
      }

      $(".puff_in_button").on("click" , function(){
        UseMagic("magic_test_1" , "puffIn" , "0")
      })

      $(".open_down_left").on("click" , function(){
        UseMagic("magic_test_2" , "openDownLeft" , "0")
      })

      $(".slide_down").on("click" , function(){
        UseMagic("magic_test_3" , "slideDown" , "0")
      })

      $(".boing_in_up").on("click" , function(){
        UseMagic("magic_test_4" , "boingInUp" , "0")
      })
      // UseMagic(".")

      // 繰り返しのテスト
      function repeatMagicTest(id , time){
        const $object = $(`#${id}`);
        let firstAddClass = false;
        setInterval(function(){
          if(!firstAddClass){
            $object.addClass("magictime puffOut");
            firstAddClass = true;
          }
          else{
            $object.toggleClass("puffIn puffOut");
          }
        }, time);
      }
      
      $(".magic_repeat_button").on("click" , function(){
        repeatMagicTest("magic_repeat_test_1" , 800);
      })

      function useAnimate(id , animationName){
        const $animateObject = $(`#${id}`);
        if(!$animateObject.hasClass("started")){
          $animateObject.addClass(`started animate__animated animate__${animationName}`);
          useAnimate(`${id}` , `${animationName}`);
        }
        else{
          if(!$animateObject.hasClass("roop_started")){
            console.log("定期的")
            setInterval(function(){
              $animateObject.toggleClass(`roop_started animate__animated animate__${animationName}`);
            } , 1000)
          }
        }
      }

      $(".animate_button1").on("click" , function(){
        useAnimate("animate_image1" , "bounce");
      })

      $(".animate_button2").on("click" , function(){
        useAnimate("animate_image2" , "wobble");
      })

      $(".animate_button3").on("click" , function(){
        useAnimate("animate_image3" , "flash");
      })

      $(".animate_button4").on("click" , function(){
        useAnimate("animate_image4" , "headShake");
      })

      $(".animate_button5").on("click" , function(){
        useAnimate("animate_image5" , "pulse");
      })

      $(".animate_button6").on("click" , function(){
        useAnimate("animate_image6" , "fadeIn");
      })

      // Animateで遊んでみる
      let nowRoopTimes = 0;

      function singleAnimatePlay(idNumber , animateName){
        console.log(`${idNumber}番のオブジェクトにクラスを与える処理`);
        let $object = $(`#animate_test_2_parent_${idNumber}`);
        $object.toggleClass(`animate__animated animate__${animateName}`);
        $object.css("display" , "inline-block");
      }

      let isFinishAnimatePlay = false;
      function animatePlaySet(roopTimes , interval , animateName){
        console.log("ループ始まり");
        for(i = 0;i <= roopTimes ; i++){
          if($(`#animate_test_2_parent_${i}`).hasClass(`animate__animated`)){
            singleAnimatePlay(i , animateName)
            console.log("クラスを解除")
            $(`#animate_test_2_parent_${i}`).css("display" , "none");
          }
        }
        roopScript = setInterval(function(){
          nowRoopTimes += 1;
          if(!isFinishAnimatePlay){
            singleAnimatePlay(nowRoopTimes , `${animateName}`)
            if(nowRoopTimes == roopTimes){
              isFinishAnimatePlay = true;
            }
          }
          else{
            console.log("既に終わりました")
            clearInterval(roopScript);
          }
        } , interval )
      }

      $(".show_animate_button").on("click" , function(){
        console.log("ボタンが押された")
        const $parentObject = $(".animate_test_2_parent_parent");
        $parentObject.css("height" , $parentObject.outerHeight());
        animatePlaySet(5 , 120 , "slideInRight");
        nowRoopTimes = 0;
        isFinishAnimatePlay = false;
      })
    }
  }
})