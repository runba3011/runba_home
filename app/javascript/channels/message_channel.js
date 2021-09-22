import consumer from "./consumer"


consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // 送信処理が行われるたびに creater_ユーザーID のボタンのhiddenを無くすようにする
    function deleteButtonSet(){
      const currentUserId = document.getElementById("current_user_id").innerHTML;
      const myDeleteButtons = document.getElementsByClassName(`creater_${currentUserId}`)
      const buttons = Array.from(myDeleteButtons)
      buttons.forEach(button =>{
        if(button.classList.contains("hidden")){
          button.classList.remove("hidden");
          console.log("hiddenを削除しました")
        }
      });
    }

    function replaceInformation(text){
      // 置換対象は
      // メッセージのIDを挿入する
      // メッセージの投稿主のIDを挿入する
      // 投稿主の名前を挿入する
      // ここには「◯秒前」というを挿入する
      // created_atをそのまま挿入する
      // メッセージのテキストを挿入する

      text = text.replace(/メッセージのIDを挿入する/g       , data.content.id);
      text = text.replace(/メッセージの投稿主のIDを挿入する/g , data.user.id);
      text = text.replace(/投稿主の名前を挿入する/g          , data.user.nickname);
      text = text.replace(/ここには「◯秒前」というを挿入する/g , `たった今`);
      text = text.replace(/created_atをそのまま挿入する/g   , data.content.created_at);
      text = text.replace(/メッセージのIDを挿入する/g        , data.content.id);
      text = text.replace(/メッセージのテキストを挿入する/g   , data.content.text);
      return text
    }

    if(data.nil == true){
      // 不適切な通信が行われたときに入るところ、削除ボタンを投稿主でもないのに押したり、からの状態での送信を行なったりした場合
      const submitButton = document.getElementById("message_submit_button");
      const confirmSubmitButton = document.getElementById("confirm_submit");
      submitButton.removeAttribute("disabled");
      confirmSubmitButton.removeAttribute("disabled");
      console.log("不適切な通信が行われました");
    }
    else{
      if(!data.is_destroy){
        console.log(data.icon_image)
    
        let HTML = 
        `
        <div class = "_messages_single_message hide_scroll_bar" id = "single_message_box_メッセージのIDを挿入する">
          <div class = "_messages_message_information">
            <!-- 幅が600px以上だったら表示されるもの -->
            <div class = "show_more_600px">
              <a href="/users/メッセージの投稿主のIDを挿入する" class = "_messages_user_information">
                iconImageHTMLを挿入する
                <p>投稿主の名前を挿入する</p>
                <p class = "_messages_created_at">ここには「◯秒前」というを挿入する</p>
                <p class = "hidden">created_atをそのまま挿入する</p>
              </a>
            </div>
    
            <!-- 幅が600px以下だったら表示されるもの -->
            <div class = "show_less_600px">
              <a href="/users/メッセージの投稿主のユーザーIDを挿入する" class = "_messages_user_information">
                iconImageHTMLを挿入する
    
                <div>
                  投稿主の名前を挿入する
                  <p class = "_messages_created_at">ここには「◯秒前」というを挿入する</p>
                  <p class = "hidden">created_atをそのまま挿入する</p>
                </div>
              </a>
            </div>
            <a data-method = "delete" href = "/groups/${data.group.id}/messages/${data.content.id}" class="_messages_message_delete hidden creater_${data.user.id}" data-remote= "true" id = "destroy_button_${data.content.id}">削除</a>
          </div>
          
  
  
          <div id = "message_content_メッセージのIDを挿入する">
            <p class ="_message_text">メッセージのテキストを挿入する</p>
            messageImageHTMLを挿入する
          </div>
        </div>
        <div class = "_messages_only_border only_border"></div>
        `;
  
        let iconImageHTML = 
        `
        <img class = "_message_user_icons" src = "アイコン画像のURLを挿入する">
        `;
  
        let messageImageHTML = 
        `
        <div class = "_message_images_box">
        <img class = "_message_images" onclick= "showBigImage(this) , adjustWidthAndHeight(this)" , id="メッセージのIDを挿入する" src = "投稿された画像のURLを挿入する" >
        <div class = "image_black"></div>
        </div>
  
        <div class = "image_show_background hidden" id = "image_show_メッセージのIDを挿入する">
          <div class = "image_show_center_object">
            <img class = "image_show_back_button" id = "メッセージのIDを挿入する" onclick="hideImageShow(this)" , src = "戻るボタンのURLを挿入する">
            <img class = "image_show_image" id = "image_show_image_メッセージのIDを挿入する" src = "投稿された画像のURLを挿入する">
          </div>
        </div>
        `; 
  
        const userIconURL = data.icon_image_url;
        const backButton = document.getElementById("for_get_back_button");
        const backButtonImageURL = backButton.src;
        const createdImageURL = data.message_image_url;
        console.log("生成された画像のURLは"+createdImageURL);
  
        // 基本的な情報を置換する処理
        HTML = replaceInformation(HTML);
        iconImageHTML = replaceInformation(iconImageHTML);
        messageImageHTML = replaceInformation(messageImageHTML)
  
        // ユーザーのアイコンに置換する処理
        iconImageHTML = iconImageHTML.replace(/アイコン画像のURLを挿入する/g , userIconURL);
  
        // 送信された画像に置換する処理
        if(createdImageURL != null){
          messageImageHTML = messageImageHTML.replace(/投稿された画像のURLを挿入する/g , createdImageURL);
          messageImageHTML = messageImageHTML.replace(/戻るボタンのURLを挿入する/g , backButtonImageURL);
        }
        else{
          console.log("画像は送信されていません");
          messageImageHTML = "";
        }
  
        HTML = HTML.replace(/iconImageHTMLを挿入する/g , iconImageHTML);
        HTML = HTML.replace(/messageImageHTMLを挿入する/g , messageImageHTML);
  
    
        // 挿入先の親を見つけ、その子要素として送られたものを入れる処理
        const messagesParent = document.getElementById("messages_parent");
        console.log("messagesは"+messagesParent);
        messagesParent.insertAdjacentHTML('beforeend' , HTML);
    
        // 画像とテキストの入力欄を空にする処理
        const MessageImage = document.getElementById("message_image");
        MessageImage.value = null;
    
        const MessageTextarea = document.getElementById("use_adjust");
        MessageTextarea.value = "";
    
        // submitに勝手につけられるdisabledを削除する
        const submitButton = document.getElementById("message_submit_button");
        const confirmSubmitButton = document.getElementById("confirm_submit");
        submitButton.removeAttribute("disabled");
        confirmSubmitButton.removeAttribute("disabled");
    
        // 画像投稿を行なった場合、画像用ウィンドウ（？）を削除、画像選択を解除
        const confirmWindowParent = document.getElementById("confirm_parent");
        confirmWindowParent.classList.add('hidden')
        const messageImage = document.getElementById("message_image");
        messageImage.value = null;
    
        const confirm_image_show = document.getElementById("confirm_image");
        confirm_image_show.removeAttribute("src");
      }
  
      else{
        // channelを用いて削除を行うところ
        console.log("コメントを削除するところ");
        const destroyObject = document.getElementById(`message_content_${data.destroy_message_id}`);
        while( destroyObject.firstChild ){
          destroyObject.removeChild( destroyObject.firstChild );
        }
        console.log(destroyObject);
        destroyObject.innerHTML = "メッセージは削除されました";
  
        const destroyButton = document.getElementById(`destroy_button_${data.destroy_message_id}`);
        destroyButton.remove();
      }
    }

    deleteButtonSet();
    ;
  }
});
