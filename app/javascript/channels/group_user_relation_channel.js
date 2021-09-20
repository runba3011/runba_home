import consumer from "./consumer"

consumer.subscriptions.create("GroupUserRelationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const singleMargin = 86;

    // 権限: という表示の部分
    const authorityShow = document.getElementById(`authority_show_${data.group_user_relation.id}`);
    authorityShow.innerHTML = `権限:${data.authority_name}`;
    console.log(authorityShow.innerHTML);

  }
});
