import consumer from "./consumer"


function getCreatedImageURL(){
  const createdImage = document.getElementById("confirm_image");
  let createdImageURL = null;
  if (createdImage.src != null && createdImage.src != "null" && createdImage.src != ""){
    console.log(createdImage);
    const createdImageURL = createdImage.src;
    console.log("投稿された画像のURLは"+createdImageURL);
    return createdImageURL;
  }
}

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const defaultImageURL = null;
    const userIcon = document.getElementById("_side_bar_current_user_icon");
    const userIconURL = userIcon.src;
    console.log("ユーザーアイコンのURLは"+userIconURL);
    const backButton = document.getElementById("for_get_back_button");

    const html = 
    `
    // HTML1---------------------------------------------------------------------
    <div class = "_messages_single_message hide_scroll_bar">
      <div class = "_messages_message_information">
        <%= link_to user_path(data.content.user) , class: "_messages_user_information" do %>
    
    // HTML2---------------------------------------------------------------------
          <% if data.content.user.icon_image.attached? %>
            <%= image_tag data.content.user.icon_image.variant(resize: '500x500') , class: "_message_user_icons" %>
          <% else %>
            <%= image_tag "defaults/user_icon_image.png" , class: "_message_user_icons" %>
          <% end %>
          <%= data.content.user.nickname %>
        <% end %>
        <p class = "_messages_created_at"><%= data.content.created_at %></p>
        <% if data.content.user == @user && data.content.text != nil %>
          <%= link_to "削除" , group_message_path(group , message) , method: :delete , class: "_messages_message_delete" %>
        <% end %>
      </div>
    
    // HTML3---------------------------------------------------------------------

      <% if data.content.text != nil %>
        <p class ="_message_text"><%= h(data.content.text).gsub(/\n|\r\n/, "<br>").html_safe %></p>

    // HTML4---------------------------------------------------------------------
        <% if data.content.image.attached? %>
          <div class = "_message_images_box">
          <%= image_tag data.content.image , class: "_message_images" , onClick: "showBigImage(this) , adjustWidthAndHeight(this)" , id: data.content.id %>
          <div class = "image_black"></div>
          </div>

          <div class = "image_show_background hidden" id = "image_show_<%= data.content.id %>">
            <div class = "image_show_center_object">
              <%= image_tag "back_button.png" , class: "image_show_back_button" , id: "#{data.content.id}" , onClick: "hideImageShow(this)" %>
              <%= image_tag data.content.image , class: "image_show_image" , id: "image_show_image_#{data.content.id}" %>
            </div>
          </div>

        <% end %>
    
        // メッセージが削除された時のものなのでここから下は必要ない
      <% else %>
        <p>メッセージは削除されました</p>
      <% end %>
    </div>
    <div class = "_messages_only_border only_border"></div>
    `;

    // 画像のすぐ上部分まで、a要素がまだ完成していない、アイコン画像の部分の最後に</a>をつける必要がある
    const HTML1 = 
    `
    
    <div class = "_messages_single_message hide_scroll_bar">
      <div class = "_messages_message_information">
        <a href = "/users/${data.content.id}" class = "_messages_user_information">

    `

    // アイコン画像と、名前のリンクを閉じる</a>、投稿日時、削除ボタン
    const HTML2 = 
    `
      <img src = ${userIconURL} class="_message_user_icons">
      ${data.user.nickname}
      </a>
      <p class = "_messages_created_at">${data.content.created_at}</p>

        <a href = " /groups/${data.group.id}/messages/${data.content.id}" class = "_messages_message_delete" data-method= "delete">削除</a>

      </div>
    `;

    // メッセージテキストの部分
    const HTML3 = 
    `
      <p class ="_message_text">${data.content.text}</p>
    `;

    // 画像の部分、添付されていないなら使用する必要がない
    const backButtonImageURL = backButton.src;
    const createdImageURL = getCreatedImageURL();
    console.log("生成された画像のURLは"+createdImageURL);

    let HTML4 = null;
    if(createdImageURL != null && createdImageURL != "null"){
      console.log("画像が投稿された");
      HTML4 = 
      `
      <div class = "_message_images_box">
        <img class = "_message_images" onClick= "showBigImage(this) , adjustWidthAndHeight(this)" id = ${data.content.id} src = "${createdImageURL}">
      <div class = "image_black"></div>
      
      </div>
      <div class = "image_show_background hidden" id = "image_show_${data.content.id}">
        <div class = "image_show_center_object">
          <img src = "${backButtonImageURL}" class="image_show_back_button" id="${data.content.id}" onClick ="hideImageShow(this)" >
          <img src = "${createdImageURL}" class="image_show_image" id = "image_show_image_${data.content.id}" >
        </div>
      </div>
      `;
    }
    else{
      console.log("画像は投稿されていません");
      HTML4 = 
      `
      `;
    }

    // only_border
    const HTML5 = 
    `
      <div class = "_messages_only_border only_border"></div>
    `;

    const AllHTML = HTML1 + HTML2 + HTML3 + HTML4 + HTML5;

    // 挿入先の親を見つけ、その子要素として送られたものを入れる処理
    const messagesParent = document.getElementById("messages_parent");
    console.log("messagesは"+messagesParent);
    messagesParent.insertAdjacentHTML('beforeend' , AllHTML);

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
});
