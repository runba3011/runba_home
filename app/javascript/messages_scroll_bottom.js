function autoScroll(){
  if(document.URL.match(/groups/)&& !document.URL.match(/edit/)){
    const messagesParent = document.getElementById("messages_parent");
    if(messagesParent != null){
      object = document.getElementsByClassName("_messages_single_message")
      if(object != null){
        object[object.length - 1].scrollIntoView(true);
      }
    };
  };
};

window.addEventListener('load' , autoScroll);