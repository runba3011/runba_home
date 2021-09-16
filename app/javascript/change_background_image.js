function change_background(){
  if(document.URL.match(/user/) && document.URL.match(/edit/)){
    const backgroundForm = document.getElementById("background_image_field");
    backgroundForm.addEventListener('change' , (e)=>{
      // 挿入先の検索、取得できていることは確認済み
      const backgroundImageParent = document.getElementById("background_image_parent");
      const image = e.target.files[0];
      const imageURL = window.URL.createObjectURL(image);

      const imageElement = document.createElement('img');
      imageElement.setAttribute('src' , imageURL);
      imageElement.setAttribute('class', "top_image");
      imageElement.setAttribute('id' , "top_image")

      removeObject = document.getElementById("top_image");
      removeObject.remove();
      backgroundImageParent.appendChild(imageElement);

      // 選択した画像を表示する処理の完成

      // ここからは編集部分だとわかりやすくする部分の作成
      const backgroundEasy = document.getElementById("background_easy");
      if(backgroundEasy != null){
        backgroundEasy.remove();
      };
    });
  };
};

window.addEventListener('load' , change_background)