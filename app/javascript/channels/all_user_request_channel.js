import consumer from "./consumer"

consumer.subscriptions.create("AllUserRequestChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("データを受け取った");
    jQuery(function($){
      if(data.control_type == "update"){
        const $request_object = $(`.request_class_${data.request.id}`);
        const $status_text = $(`.now_status_${data.request.id}`);
        
        $request_object.removeClass("finished_color received_color untreated_color");
        
        if(data.request.status == 2){
          $request_object.addClass("finished_color");
          $status_text.text("");
          $status_text.prepend('現在の状況<span class = "now_status_detail"><i class="fas fa-award status_awesome"></i></i>完了！</span>');
        }
        else if(data.request.status == 1){
          $request_object.addClass("received_color");
          $status_text.text('');
          $status_text.prepend('現在の状況<span class = "now_status_detail"><i class="fas fa-check status_awesome"></i>採用！</span>');
        }
        else if(data.request.status == 0){
          $request_object.addClass("untreated_color");
          $status_text.text("");
          $status_text.prepend('現在の状況<span class = "now_status_detail">未処理</span>');
        }
      }
      else if (data.control_type == "destroy"){
        const $request_object = $(`.request_class_${data.request.id}`);
        const $status_text = $(`.now_status_${data.request.id}`);
        
        $request_object.parent().animate({height: "0px"} , 500)
        $request_object.animate({opacity: 0} , 500 , function(){
          $request_object.remove();
        })

        // 消すオブジェクトの一番上までスクロールする
        const scrollHeight = $request_object.offset().top  - 150;
        console.log(scrollHeight)
        $('body , html').animate({scrollTop:scrollHeight} , 300)
      }
    })
  }
});
