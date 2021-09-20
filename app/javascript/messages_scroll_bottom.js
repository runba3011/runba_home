function autoScroll(){
  if(document.URL.match(/groups/)){
    const messagesParent = document.getElementById("messages_parent");
    if(messagesParent != null){
      const bottom = messagesParent.getBoundingClientRect().bottom;
      messagesParent.scrollTo(0,bottom);
    }
  }

}

window.addEventListener('load' , autoScroll)