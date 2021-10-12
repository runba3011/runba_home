jQuery(function($){
  if(document.URL.match(/users/) && document.URL.match(/all_user_requests/)){
    const $openSortButton = $(".open_sort_button");
    const $sortButtonParent = $(".sort_buttons")

    if($openSortButton.length >= 1){
      console.log("並び替えボタンを開くやつ");

      $openSortButton.on("click" , function(){
        $sortButtonParent.slideToggle();
        if($openSortButton.text() != "閉じる"){
          $openSortButton.text("閉じる")
        }
        else{
          $openSortButton.text("並び替えを使用する");
        }
      })
    }
  }
})