class Movie < ActiveHash::Base
  # 後ろの１１桁の文字列のみlinkの部分に入れる
  self.data = [
    {id: 1 , reccomend: true , title: "1つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} , 
    {id: 2 , reccomend: true , title: "2つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 3 , reccomend: true , title: "3つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 4 , reccomend: true , title: "4つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 5 , reccomend: true , title: "5つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 6 , reccomend: false , title: "6つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 7 , reccomend: false , title: "7つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 8 , reccomend: false , title: "8つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 9 , reccomend: false , title: "9つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 10 , reccomend: false , title: "10つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 11 , reccomend: false , title: "11つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,
    {id: 12 ,  reccomend: false , title: "12つめの動画" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！"} ,

  ]

end