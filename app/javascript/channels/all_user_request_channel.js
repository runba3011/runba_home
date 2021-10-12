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

      const $request_object = $(`.request_class_${data.request.id}`);
      const $status_text = $(`.now_status_${data.request.id}`);
      console.log($request_object.length)
      
      $request_object.removeClass("finished_color received_color untreated_color");
      
      if(data.request.status == 2){
        $request_object.addClass("finished_color");
        $status_text.text("");
        $status_text.prepend('現在の状況：<i class="fas fa-award status_awesome"></i></i>完了！');
      }
      else if(data.request.status == 1){
        $request_object.addClass("received_color");
        $status_text.text('');
        $status_text.prepend('現在の状況：<i class="fas fa-check status_awesome"></i>採用！');
      }
      else if(data.request.status == 0){
        $request_object.addClass("untreated_color");
        $status_text.text("");
        $status_text.prepend('現在の状況：<i class="fas fa-check status_awesome"></i>採用！');
      }
    })
  }
});
