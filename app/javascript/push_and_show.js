function start(){
  // 「何かを押したら何かが現れる」という簡単な仕組みなので、
  // URLによって処理の内容を変えはするものの一つのファイルに統合する

  // 特定のボタンがクリックされたときに、表示したものを閉じる処理、引数は大体0を入れる
  // closeObjectIDはclassにhiddenを与えるオブジェクトのIDを入れる
  function useCloseButton(useNumber, closeObjectID){
    const closeButton = document.getElementsByClassName("close_button");

    closeButton[useNumber].addEventListener("click" , ()=>{
      console.log(closeObjectID+"をさがします");
      const closeObject = document.getElementById(closeObjectID);
      closeObject.classList.add("hidden");
      console.log("閉じます");
    });
  };

  // 特定のものがクリックされたときに表示する処理、
  // openButtonIDには押したら開くボタンのID,openObjectIDには開くオブジェクトのIDを入れる
  function useOpenButton(openButtonID , openObjectID , isAutoOpen){
    const openButton = document.getElementById(openButtonID);

    function openAction(){
      console.log(openObjectID+"をさがします");
      const openObject = document.getElementById(openObjectID);
      openObject.classList.remove("hidden");
      console.log("開きます");
    }

    if(isAutoOpen){
      openAction();
    }

    if(!isAutoOpen){
      openButton.addEventListener("click" , ()=>{
        openAction();
      });
    }
  }

  // グループ編集画面
  if(document.URL.match(/groups/) && document.URL.match(/edit/)){
    const button = document.getElementById("edit_button_show_button_parent");
    const angleDown = document.getElementById("edit_button_show_button");
    console.log(getComputedStyle(angleDown , null ).getPropertyValue('display'));

    // 下向きの三角形（？）がhiddenを持っていないということは横幅がそれなりに小さいということ
    button.addEventListener("click" , ()=>{
      if(getComputedStyle(angleDown , null ).getPropertyValue('display') != "none"){
        useOpenButton("edit_button_show_button_parent" , "all_button_show" , true);
      }
      else{
        console.log("横幅が小さくないので見せない");
      };
    });

    useCloseButton("0" , "all_button_show")
  }
  // グループ詳細（トーク）画面
  else if(document.URL.match(/groups/)){
    // 開く動作
    const clickObject = document.getElementsByClassName("_main_bar_group_control_buttons");
    clickObject[0].addEventListener("click" , ()=>{
      const angleDown = document.getElementsByClassName("fa-angle-down");
      if(getComputedStyle(angleDown[0] , null).getPropertyValue('display') != "none"){
        console.log("みせる処理");
        useOpenButton("open_button", "controlled_button" , true);
      }
      else{
        console.log("横幅が小さくないので見せない");
      }
    });

    // 閉じる動作
    useCloseButton(0, "controlled_button");
  };
};

window.addEventListener("load" , start)