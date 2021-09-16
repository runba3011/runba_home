function change_background(){
  if(document.URL.match(/user/) && document.URL.match(/edit/)){
    console.log("画像変更のスクリプト");
  }
}

window.addEventListener('load' , change_background)