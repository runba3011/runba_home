jQuery(function($){
  if(document.URL.match(/users/) && document.URL.match(/all_user_requests/)){
    const $openSortButton = $(".open_sort_button");
    const $sortButtonParent = $(".sort_buttons")
    const $openSortButtonBorder = $(".open_sort_button_border");

    if($openSortButton.length >= 1){

      $openSortButton.on("click" , function(){
        $openSortButtonBorder.css("opacity" , "1");
        $sortButtonParent.slideToggle(function(){
          $openSortButtonBorder.animate({opacity: 0} , 300)
        });
        if($openSortButton.text() != "閉じる"){
          $openSortButton.text("閉じる")
        }
        else{
          $openSortButton.text("並び替えを使用する");
        }
      })

      /* 同じページで使用するスクリプトなので、
        あまりの長文を入力された時にスクロールバーや全文表示ボタンを
        そのオブジェクトにのみ表示するスクリプトをここに作成しておく */

      const $text = $(".request_content");
      $text.each(function(index , element){
        const maxHeight = 500;
        const $element = $(element);
        if($element.height() >= maxHeight){
          console.log($element.height());
          $element.css({
            "max-height": `${maxHeight}px`
          });
          $element.next().css("display" , "block");
        }
        else{
          $element.css({
            "max-height": "inherit"
          });
        }

        $element.next().on("click" , function(){
          if($(this).text() != "閉じる"){
            // 滑らかな動きにするためにmax-heightを一瞬だけ解放、その時の高さを取得して改めてmax-heightを設定する
            $element.css({
              "max-height":"inherit"
            });
  
            const height = $element.height();
            $element.css("max-height" , `${maxHeight}px`);
  
            $element.animate({"max-height": height} , 300 , function(){
              $element.next().text("閉じる");
            });
          }
          else{
            const scrollHeight = $element.offset().top  - 150;
            console.log(scrollHeight)
            $('body , html').animate({scrollTop:scrollHeight} , 300)
            $element.animate({"max-height":`${maxHeight}px`} , 300 , function(){
              $element.next().text("全文を見る")
            })
          }
        })
      })
    }
  }
})