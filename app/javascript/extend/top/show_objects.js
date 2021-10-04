function intersectAction(elements,callback,observerOptions){"use strict";const forEach=Array.prototype.forEach,toString=Object.prototype.toString;function typeOf(obj){return void 0!==window.jQuery&&obj instanceof jQuery?"jquery":toString.call(obj).slice(8,-1).toLowerCase()}const elementsType=typeOf(elements);null==observerOptions&&(observerOptions={root:null,rootMargin:"0px",threshold:0});const observer=new IntersectionObserver(doIntersect,observerOptions);if("jquery"===elementsType){const doms=elements.get();forEach.call(doms,(function(dom){observer.observe(dom)}))}else"nodelist"===elementsType||"htmlcollection"===elementsType?forEach.call(elements,(function(element){observer.observe(element)})):observer.observe(elements);function doIntersect(entries){"jquery"===elementsType?forEach.call(entries,(function(entry){callback(jQuery(entry.target),entry.isIntersecting,observer)})):forEach.call(entries,(function(entry){callback(entry.target,entry.isIntersecting,observer)}))}console.log(elementsType)}

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
    // オブジェクトの取得に成功していることを確認するために一時的にピンクにしている
    $object1.css("background-color" , "pink")
    console.log("動作テスト")
    intersectAction($object1, function(element, isIntersecting){
      if(isIntersecting){
        console.log("見える")
      }
    })

  }
})