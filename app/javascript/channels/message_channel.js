import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("送信した");
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
    debugger;
    const HTML1 = 
    `
    
    <div class = "_messages_single_message hide_scroll_bar">
      <div class = "_messages_message_information">
        <a href = "/users/${data.content.user.id}" class = "_messages_user_information">

        <p class = "_messages_created_at"><%= data.content.created_at %></p>
        <% if data.content.user == @user && data.content.text != nil %>
          <%= link_to "削除" , group_message_path(group , message) , method: :delete , class: "_messages_message_delete" %>
        <% end %>
      </div>
    `;

    // アイコン画像（デフォルト）と、名前のリンクを閉じる</a>がついている
    const HTML2_1 = 
    `
      <img src = ${defaultImageURL} class="_message_user_icons">
      ${data.content.user.nickname}
      </a>
      </div>
    `;

    // アイコン画像（設定されたもの）と、名前のリンクを閉じる</a>がついている、
    // アイコン画像が設定されていない限りHTML2_2はnullのままである
    let HTML2_2 = null;
    if(data.content.user.icon_image != null){
      HTML2_2 = 
      `
        <img src = ${data.content.user.icon_image} class="_message_user_icons">
        ${data.content.user.nickname}
        </a>
        </div>
      `;
    }

    // メッセージテキストの部分
    const HTML3 = 
    `
      <p class ="_message_text">${data.content.text}</p>
    `;

    // 画像の部分、添付されていないなら使用する必要がない
    let HTML4 = null;
    if(data.content.image != null){
      HTML4 = 
      `
      <div class = "_message_images_box">
        <img class = "_message_images" onClick= "showBigImage(this) , adjustWidthAndHeight(this)" id = ${data.content.id} src = "${data.content.image}">
      <div class = "image_black"></div>
      
      <div class = "image_show_background hidden" id = "image_show_<%= data.content.id %>">
        <div class = "image_show_center_object">
          <img src = "${backButtonImageURL}" class="image_show_back_button" id="${data.content.id}" onClick ="hideImageShow(this)" >
          <img src = "${messagei.image}" class="image_show_image" id = "image_show_image_${data.content.id}" >
        </div>
      </div>
      `;
    }

    // 最後の閉じタグ
    const HTML5 = 
    `
      </div>
    `;

    let AllHTML = HTML1;
    if(HTML2_2 == null){
      AllHTML += HTML2_1;
    }
    else{
      AllHTML += HTML2_2;
    }
    AllHTML += HTML3 + HTML4 + HTML5;

    // 挿入先の親を見つけ、その子要素として送られたものを入れる処理
    const messagesParent = document.getElementById("messages_parent");
    console.log("messagesは"+messagesParent);
    messagesParent.insertAdjacentHTML('beforeend' , AllHTML);

    // 画像とテキストの入力欄を空にする処理
    const MessageImage = document.getElementById("message_image");
    MessageImage.value = null;

    const MessageTextarea = document.getElementById("use_adjust");
    MessageTextarea.value = "";
  }
});
