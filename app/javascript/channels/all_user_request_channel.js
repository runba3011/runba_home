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
      console.log($request_object.length)
      
      $request_object.removeClass("finished_color received_color untreated_color");
      if(data.request.status == 2){
        $request_object.addClass("finished_color");
      }
      else if(data.request.status == 1){
        $request_object.addClass("received_color");
      }
      else if(data.request.status == 0){
        $request_object.addClass("untreated_color");
      }
    })
  }
});
