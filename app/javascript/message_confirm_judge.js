function hide(){
    const confirmWindowParent = document.getElementById("confirm_parent");
    confirmWindowParent.classList.add('hidden')
    const messageImage = document.getElementById("message_image");
    messageImage.value = null;
}

function judge(){
  if(document.URL.match(/groups/)){
    const deleteButton = document.getElementById("confirm_delete");
    deleteButton.addEventListener('click' , hide);
  };
};

window.addEventListener('load' , judge);