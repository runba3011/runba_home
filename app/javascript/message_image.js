function add_image(){
  if(document.URL.match(/groups/)){
    // messageImageは投稿する画像の設定をするたびに変更する
    let messageImage = document.getElementById("message_image");
    let previewCreatedAmount = 0;
    if (messageImage != null){
      messageImage.addEventListener('change' , (e)=>{
        previewCreatedAmount ++;
        console.log(previewCreatedAmount)
        const image = e.target.files[0]
        const imageURL = window.URL.createObjectURL(image);
        // これで作成した画像のURLの取得が完了

        const confirmText = document.getElementById("confirm_text");
        // 生成した画像を挿入する部分の取得

        const insertImage = document.createElement('img');
        insertImage.setAttribute('src' , imageURL);
        insertImage.setAttribute('class' , 'confirm_image')
        insertImage.setAttribute('id' , 'confirm_image')
        // これで生成する画像の用意が完了、クラスなどは変更する可能性あり

        const confirmWindowParent = document.getElementById("confirm_parent");
        confirmWindowParent.classList.remove('hidden');
        // これで確認ウィンドウの表示が完了

        beforeImage = document.getElementById("confirm_image");
        beforeImage.remove();

        confirmText.insertAdjacentElement('beforeend' , insertImage);
        // 「この画像を投稿しますか？」の後ろに投稿するつもりの画像を表示する


      });
    }
  };
};

window.addEventListener('load' , add_image);