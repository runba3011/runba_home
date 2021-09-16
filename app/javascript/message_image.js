function add_image(){
  if(document.URL.match(/groups/)){
    const messageImage = document.getElementById("message_image");
    if (messageImage != null){
      console.log("プレビュー用のスクリプトを使用します");
    }
  };
};

window.addEventListener('load' , add_image);