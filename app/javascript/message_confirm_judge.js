function judge(){
  if(document.URL.match(/groups/)){
    const deleteButton = document.getElementById("confirm_delete");
    deleteButton.addEventListener('click' , ()=>{
      const confirmWindowParent = document.getElementById("confirm_parent");
      confirmWindowParent.setAttribute('class' , 'hidden')
      const messageImage = document.getElementById("message_image");
      messageImage.value = null;
      // 要確認
    });
  };
};

window.addEventListener('load' , judge);