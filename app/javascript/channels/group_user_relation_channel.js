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
    
    // 権限上昇ボタン
    const authorityUp = document.getElementById(`authority_up_${data.group_user_relation.id}`);

    // 権限制限ボタン
    const authorityDown = document.getElementById(`authority_down_${data.group_user_relation.id}`);

    let isAuthorityMax = false;
    let isAuthorityMin = false;
    if(data.operater_authority != 1){
      isAuthorityMax = data.group_user_relation.id == data.operater_authority - 1;
    }
    else{
      isAuthorityMax = data.group_user_relation.id == data.operater_authority;
    }
    isAuthorityMin = data.group_user_relation.id == 1;

    let authorityLevelShowMargin = 0;
    let authorityUpMargin = 0;
    let authorityDownMargin = 0;
    if(data.operater_authority >= 3){
      if(isAuthorityMax){
        // 権限が最大だったら権限上昇ボタンが現れない、権限レベルを見せる部分の右側にボタン１つ分のmargin
        authorityLevelShowMargin = singleMargin;
      }
      else{
        authorityLevelShowMargin = 0;
      }
  
      if(isAuthorityMin){
        // 表示するユーザーの権限が１だったら権限制限ボタンが現れない、権限上昇ボタンの右側に１つ分のmargin
        authorityDownMargin = singleMargin;
      }
      else{
        authorityDownMargin = 0;
      }
    }
    else if(data.operater_authority == 2){
      // 追放ボタンが存在しない、権限上昇か権限制限のどちらかしか現れない
      if(data.group_user_relation.authority_id >= 3){
        // 自分より権限が高い相手、権限以外表示しない
        authorityLevelShowMargin = singleMargin * 3;
      }
      
      else if(data.group_user_relation.authority_id == 2){
        authorityUpMargin = singleMargin * 2;
        authorityLevelShowMargin = 0;
      }
      else if(data.group_user_relation.authority_id == 1){
        authorityUpMargin = singleMargin;
        authorityDownMargin = singleMargin;
      }
    }
    else if(data.operater_authority == 1){
      authorityLevelShowMargin = 1;
    }
    else{
      console.log("操作者のauthority_idがおかしなことになっています");
    }


  }
});
