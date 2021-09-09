class Movie < ActiveHash::Base
  # 後ろの１１桁の文字列のみlinkの部分に入れる
  self.data = [
    {id: 1 , reccomend: true , title: "【AIきりたん】恋色マスタースパーク" , link: "AQO0OR-LTQQ" , image: nil , explain: "説明を書こう！" , small_explain: "自分の動画を見ることが少ないルンバ氏が、何度も見たくなるレベルにおすすめ。実のところを申しますと解説系の動画って後からまたみてみると「なにこいつ偉そうに言ってるんだろう」って思って複雑な気持ちになるんですよね。"} , 
    {id: 2 , reccomend: true , title: "ためしにすごいほどにながいたいとるをつけてみよう！やじゅうせんぱいばんざい！やじゅうせんぱいばんざい！" , link: "KBclKqeILkU" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 3 , reccomend: true , title: "3つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 4 , reccomend: true , title: "4つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 5 , reccomend: true , title: "5つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 6 , reccomend: false , title: "6つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 7 , reccomend: false , title: "7つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 8 , reccomend: false , title: "8つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 9 , reccomend: false , title: "9つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 10 , reccomend: false , title: "10つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 11 , reccomend: false , title: "11つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 12 ,  reccomend: false , title: "12つめの動画" , link: "AQO0OR-" , image: nil , explain: "説明を書こう！" , small_explain: nil} 

  ]

  include ActiveHash::Associations
  has_many :movie_comments

end