jQuery(function($){
  if(document.URL.match(/top/)&& document.URL.match(/detail/)){
    $scrollButton = $(".information_link");

    $scrollButton.on("click" , function(){
      const $scrollPointObject = $(`.${this.id}`);

      const scrollHeight = $scrollPointObject.offset().top - 100;
      console.log(scrollHeight);
      $(window).scrollTop(scrollHeight);
    })
  }
})