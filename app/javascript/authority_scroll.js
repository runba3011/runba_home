// 未完成、遷移後のページで特定の位置までスクロールする処理がわかったら更新したい
let positionX = 0;
let positionY = 0;

function getElements(){
  const positionPoint = document.getElementById("position_point");
  const members = document.getElementById("messages_parent");
  const newMember = document.getElementById("new_user_box");
  const firstNewMemberPointY = newMember.getBoundingClientRect().top;
  
  function getPosition(){
    newMemberY = newMember.getBoundingClientRect().top;
    let positionPointY = positionPoint.getBoundingClientRect().top;
    authorityPoint = firstNewMemberPointY - newMemberY;
    console.log(authorityPoint);

    function autoScroll(){
      window.alert("テスト");
      console.log("遷移");
      members.scrollTo(0,authorityPoint);
    }

    window.addEventListener("beforeunload", autoScroll);
  };
  members.addEventListener('scroll', getPosition);
};



function setPosition(){
}


window.addEventListener('load' , getElements);