function autoScroll(){
  const messagesParent = document.getElementById("messages_parent");
  const bottom = messagesParent.getBoundingClientRect().bottom;
  messagesParent.scrollTo(0,bottom);

}

window.addEventListener('load' , autoScroll)