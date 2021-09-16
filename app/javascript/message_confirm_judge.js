function judge(){
  if(document.URL.match(/groups/)){
    const deleteButton = document.getElementById("confirm_delete");
    const submitButton = document.getElementById("confirm_submit");
    // 送信ボタンの動作は必要ない気がしてきた
    deleteButton.addEventListener('click' , ()=>{
      const confirmWindowParent = document.getElementById("confirm_parent");
      confirmWindowParent.setAttribute('class' , 'hidden')
    });
  };
};

window.addEventListener('load' , judge);