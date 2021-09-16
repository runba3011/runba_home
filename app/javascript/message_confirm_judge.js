function judge(){
  if(document.URL.match(/groups/)){
    const deleteButton = document.getElementById("confirm_delete");
    deleteButton.addEventListener('click' , ()=>{
      const confirmWindowParent = document.getElementById("confirm_parent");
      confirmWindowParent.setAttribute('class' , 'hidden')
    });
  };
};

window.addEventListener('load' , judge);