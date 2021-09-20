import consumer from "./consumer"

consumer.subscriptions.create("MovieCommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // 動画視聴のビューファイルからそのままコピーしたもの、
    // 条件に応じて構築するものを変更する、
    // 参考にするために表示しているだけ

    const HTML = `
    <div class = "single_comment_set">
      <%= link_to user_path(comment.user) , class:"comment_user_information" do %>
        <div class = "comment_user_icon_parent" style="display:flex; width: 50px; height:50px;">
          <% if comment.user.icon_image.attached? %>
            <%= image_tag comment.user.icon_image , class: "comment_user_icon" %>
          <% else %>
            <%= image_tag "defaults/user_icon_image.png" , class: "comment_user_icon" %>
          <% end %>
        </div>
        <p class = "comment_user_name"><%= comment.user.nickname %></p>
      <% end %>
      <p class = "comment_text hide_scroll_bar"><%= h(comment.text).gsub(/\n|\r\n/, "<br>").html_safe %></p>
    </div>
    `;

    const imageURL = data.user_icon;
    const addHTML =  
    `
    <div class = "single_comment_set">
      <a class = "comment_user_information href = "/users/${data.user.id}">
        <div class = "comment_user_icon_parent" style="display:flex; width: 50px; height:50px;">
          <img src = ${imageURL} class = "comment_user_icon" >
        </div>
        <p class = "comment_user_name">${data.user.nickname}</p>
      </a>
      
      <p class = "comment_text hide_scroll_bar">${data.comment.text}</p>
    </div>
    `;

    const commentParent = document.getElementById("all_coment_parent");
    commentParent.insertAdjacentHTML("beforeend" , addHTML);
    // これで挿入用HTMLを作成し、それを挿入する処理が完了した

    const textarea = document.getElementById("use_adjust");
    textarea.value = "";

    const submitButton = document.getElementById("submit_button");
    submitButton.removeAttribute("disabled");
  }
});
