function adjust_height(){
  if(document.URL.match(/movies/)|| document.URL.match(/requests/) || document.URL.match(/groups/)){
    //textareaの要素を取得
    let textarea = document.getElementById("use_adjust");
    //textareaのデフォルトの要素の高さを取得
    let clientHeight = textarea.clientHeight;
  
    console.log(textarea);
  
    //textareaのinputイベント
    textarea.addEventListener("input", ()=>{
      console.log("入力されました");
      //textareaの要素の高さを設定（rows属性で行を指定するなら「px」ではなく「auto」で良いかも！）
      textarea.style.height = clientHeight + 'px';
      //textareaの入力内容の高さを取得
      let scrollHeight = textarea.scrollHeight;
      //textareaの高さに入力内容の高さを設定
      textarea.style.height = scrollHeight + 'px';
    });
  }
}



window.addEventListener("load" , adjust_height)
