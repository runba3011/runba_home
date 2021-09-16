let created_amount = 0;

function add_member(){
  if(document.URL.match(/groups/) ){

    const add_button = document.getElementById("add_member");
    const root_add_object = document.getElementById("root_member_box");
    const add_point = document.getElementById("add_member");
    if(add_button != null){
      add_button.addEventListener('click' , ()=>{
        created_amount += 1;
        let add_object = root_add_object.outerHTML;
        next_id = "delete_button"+created_amount
        add_object = add_object.replace("delete_button0" , next_id)
        individual_delete_button = add_object.lastElementChild;
        
        add_point.insertAdjacentHTML("beforebegin" , add_object);
      });
    }

  };
};

window.addEventListener("load" , add_member);


