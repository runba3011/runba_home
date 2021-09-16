function change_icon(){
  if(document.URL.match(/users/) && document.URL.match(/edit/)){
    // console.log("アイコン変更用スクリプトを使用します");
    const iconImageForm = document.getElementById("icon_image_form");
    iconImageForm.addEventListener('change' , (e)=>{
      const iconImageBox = document.getElementById("icon_image_box");
      image = e.target.files[0];
      imageURL = window.URL.createObjectURL(image);

      const beforeImage = document.getElementById('show_user_icon');
      beforeImage.remove();
      // これで既存の画像が削除されたはず

      const iconImageElement = document.createElement('img');
      iconImageElement.setAttribute('src' , imageURL);
      iconImageElement.setAttribute('class' , 'show_user_icon');
      iconImageElement.setAttribute('id', 'show_user_icon');
      iconImageBox.insertAdjacentElement('afterbegin' , iconImageElement);
      // これで画像を生成し終えたはず



    });
  };
};

window.addEventListener('load' , change_icon)