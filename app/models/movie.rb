class Movie < ActiveHash::Base
  # 後ろの１１桁の文字列のみlinkの部分に入れる
  self.data = [
    {id: 1 , reccomend: true , title: "【きりたんの初登場】クッキーとは何か？" , link: "8lPLWWVXNa0" , image: nil , explain: "ひじょうにながいせつめいをかこうではないか" , small_explain: "自分の動画を見ることが少ないルンバ氏が、何度も見たくなるレベルにおすすめ。実のところを申しますと解説系の動画って後からまたみてみると「なにこいつ偉そうに言ってるんだろう」って思って複雑な気持ちになるんですよね。"} , 
    {id: 2 , reccomend: true , title: "認知症とは何か？【ボイスロイド解説】" , link: "KBclKqeILkU" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 3 , reccomend: true , title: "淫夢が長生きな理由に迫るぜ【ボイスロイド解説】" , link: "_jbegc0cySo" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 4 , reccomend: true , title: "プロテインが体にいい理由５選【ボイスロイド解説】" , link: "pQBJWCH4xdE" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 5 , reccomend: true , title: "大企業のエイプリルフール【ボイスロイド解説】" , link: "O9g1fA8ElCk" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 6 , reccomend: false , title: "淫夢の被害者たちがこちら【ボイスロイド解説】" , link: "7OHR-_dTurM" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 7 , reccomend: false , title: "収入が5倍！？高度経済成長の秘密【ボイスロイド解説】" , link: "kdpHAKwXamE" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 8 , reccomend: false , title: "【悪用厳禁】簡単に嘘を見分ける方法がこちら【ボイスロイド解説】" , link: "F4Ovqb96Ono" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 9 , reccomend: false , title: "他人を見下す５つの理由【ボイスロイド解説】" , link: "T5Lpgugrirk" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 10 , reccomend: false , title: "【下ネタ注意】81％が知らない！？お○ち○んち○んの秘密" , link: "Xe8-r940meQ" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 11 , reccomend: false , title: "【暴露】底辺YouTuberの実態がやばい・・・！" , link: "tq4-lMPGEwk" , image: nil , explain: "説明を書こう！" , small_explain: nil} , 
    {id: 12 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 13 ,  reccomend: false , title: "どうして睡眠は必要なのか？【ボイスロイド解説】" , link: "kQNeNpiQqVw" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 14 ,  reccomend: false , title: "【きりたん朗読】scp-444-jp　緋色の鳥" , link: "ohZ5qDxKGSU" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 15 ,  reccomend: false , title: "【ゆかりさん朗読】scp-444-jp　緋色の鳥" , link: "_0roraafE64" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 16 ,  reccomend: false , title: "世界を支配する「２：８」【ボイスロイド解説】" , link: "b_SVI1RKxu0" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 17 ,  reccomend: false , title: "【悪用厳禁】デマの正しい広め方【ボイスロイド解説】" , link: "e2dt_U3AqFc" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 18 ,  reccomend: false , title: "【社畜必見】正しいストレスの解消方法がこちら【ボイスロイド解説】" , link: "wk0cRizM7DM" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 19 ,  reccomend: false , title: "それでも、あなたは酒を飲みますか？【ボイスロイド解説】" , link: "cdo14J4Vp8w" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 20 ,  reccomend: false , title: "あなたが更新できそうなギネス記録7選【ボイスロイド解説】" , link: "pPtXXpcoZNA" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 21 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 22 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 23 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 24 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 25 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 26 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 27 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 28 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 29 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 30 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 31 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 32 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 33 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 34 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 35 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 36 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 37 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 38 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} ,
    {id: 39 ,  reccomend: false , title: "【下ネタ皆無】小学生の考える出産の方法がこちら" , link: "q39_5oMv4RY" , image: nil , explain: "説明を書こう！" , small_explain: nil} 

  ]

  include ActiveHash::Associations
  has_many :movie_comments

end