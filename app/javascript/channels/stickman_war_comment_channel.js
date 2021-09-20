import consumer from "./consumer"

consumer.subscriptions.create("StickmanWarCommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = 
    `
    <div class = "_comment_single_box">
      <div class = "_comment_information_box">
        <div class = "_comment_information_box_user_time">
          <a class = "_comment_user_links" href = " /users/${data.user.id}}">
            <div class = "_comment_user_icon_parent">
              <img src="${data.user_icon_url}" , class="comment_user_icon">
            </div>
            <div class = "_comment_name_and_time">
              <p class = "_comment_user_name">${data.user.nickname}</p>
              <p class = "_comment_created_time">${data.comment.created_at}</p>
            </div>
          </a>
        </div>
        <div class = "_comment_information_box_actions">
        </div>
      </div>
      <p class = "_comment_text hide_scroll_bar">　${data.comment.text}</p>
    </div>
    `;

    const commentsParent = document.getElementById("comments_parent");
    commentsParent.insertAdjacentHTML("beforeend" , html);
    console.log("挿入完了")
    // コメント欄の最後の部分にコメントを挿入する処理
    
    const textarea = document.getElementById("comment_text_box");
    const submitButton = document.getElementById("comment_submit_button");

    textarea.value = "";
    submitButton.removeAttribute("disabled");

  }
});
