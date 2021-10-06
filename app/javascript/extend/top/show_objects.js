function intersectAction(elements,callback,observerOptions){"use strict";const forEach=Array.prototype.forEach,toString=Object.prototype.toString;function typeOf(obj){return void 0!==window.jQuery&&obj instanceof jQuery?"jquery":toString.call(obj).slice(8,-1).toLowerCase()}const elementsType=typeOf(elements);null==observerOptions&&(observerOptions={root:null,rootMargin:"0px",threshold:0});const observer=new IntersectionObserver(doIntersect,observerOptions);if("jquery"===elementsType){const doms=elements.get();forEach.call(doms,(function(dom){observer.observe(dom)}))}else"nodelist"===elementsType||"htmlcollection"===elementsType?forEach.call(elements,(function(element){observer.observe(element)})):observer.observe(elements);function doIntersect(entries){"jquery"===elementsType?forEach.call(entries,(function(entry){callback(jQuery(entry.target),entry.isIntersecting,observer)})):forEach.call(entries,(function(entry){callback(entry.target,entry.isIntersecting,observer)}))}console.log(elementsType)}

jQuery(function($){
  if($(`#_link_5`) != null){
    let count = 0;
    let timer = 0;
    console.log("トップページ用スクリプトを使用します")
    function singleAction(object){
      const $object = object
      count += 1;
      // レスポンシブデザインの都合上、一つの機能へのリンクが二つあるため2で予め割っておく
      console.log(count);
      if(Math.floor(count / 2) % 2 == 0){
        $object.addClass("magictime spaceInRight");
      }
      else{
        $object.addClass("magictime spaceInLeft");
      }
    }
    const $objects = $(`.extend_show_object`);

    // 余裕がある時に、下にスクロールしたら下の方のオブジェクトが見えるように変更する
    intersectAction($objects, function(element, isIntersecting){
      if(isIntersecting){
        console.log("見える")
      }
    })

    // タイマーを設定するためだけの部分、他の機能はつけない
    setInterval(function(){
      timer += 0.01;
    }, 10)

    let actionTimes = 0;
    function actionSet(interval, times){
      roopScript = setInterval(() => {
        if(actionTimes < times){
          if(actionTimes * interval / 1000 < timer){
            // タイマーの方がインターバルよりも大きいとき、つまり動作するとき
            actionTimes += 1;
            console.log(`${actionTimes}番目のオブジェクトを操作します`)
            singleAction($objects.eq(actionTimes-1));
            $objects.eq(actionTimes - 1).css("opacity" , "1");
          }
        }
        else{
          console.log("スライド動作が終了しました")
          clearInterval(roopScript);
        }
      }, 10);
    }

    actionSet(50 , $objects.length);

  }
})