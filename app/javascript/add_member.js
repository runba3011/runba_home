function add_member(){
  if(document.URL.match(/groups/) ){
    console.log("野獣先輩");
    const add_button = document.getElementById("add_member");
    const add_object = document.getElementById("root_member_box");
    const add_point = document.getElementById("add_member");

    add_button.addEventListener('click' , ()=>{
      add_point.insertAdjacentHTML("beforebegin" , add_object.outerHTML);
    });
  };
};



window.addEventListener("load" , add_member);
