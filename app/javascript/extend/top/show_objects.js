jQuery(function($){
  if($(`#_link_5`) != null){
    let count = 0;
    console.log("トップページ用スクリプトを使用します")
    function singlePuffIn(object){
      const $object = object

      if(count % 2 == 0){
        $object.addClass("magictime spaceInRight");
      }
      else{
        $object.addClass("magictime spaceInLeft");
      }
    }
    $object1 = $(`#_link_1`);
    $object2 = $(`#_link_2`);
    $object3 = $(`#_link_3`);
    $object4 = $(`#_link_4`);
    $object5 = $(`#_link_5`);
    $object1.on('inview' , function(){
      console.log("見える")
      singlePuffIn($object1)
    })

  }
})