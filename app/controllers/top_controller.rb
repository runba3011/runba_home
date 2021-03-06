class TopController < ApplicationController
  def index
    @stickman_war_explain = "棒人間たちのタワーディフェンスゲーム！ルンバ氏が なんか盾持ってるキャラいるけどそれ使わないんだ と某漫画戦争をやっている時に考え、 文句をつけるなら自分で作ろうじゃないか と謎行動力を発揮した結果生まれた作品。ステージやキャラクターを追加実装予定！"
    @movie_explain = "ルンバ氏の持ちうる最大規模のコンテンツ。2019年5月から始まった。その時期に投稿された動画はことごとく限定公開になっている。とある場所から見れるようになっているので探してみよう。"
    @group_explain = "「それTwitterでよくね」「それDiscordで良くね」そういうことを言われると非常に悲しい気持ちになります。"
    @request_explain = "ルンバ氏に対して直接リクエストを送ることができます。「それYouTubeで良くね」「それTwitterで良くね」とか言われると悲しい気持ちになります。頑張って作ったから使って"
    @programing_explain = "プログラミングの学習記録を見ることができたり、特殊な処理を用いて必要のない動きをつけまくったページを見ることができます。他に特にできることはないですけども、「技術の無駄遣いで草」とつぶやいていってください。"
    @all_user_request_explain = "全てのユーザーが互いにリクエストを出すことができる部分になります。ちなみにこれを作ったのは、skill room で練習を積んでからだったため、いい感じの動きのあるページになっています。リクエストを送るつもりはなくても普通に面白いからおすすめ。"
    @material_explain = "ルンバ氏が作成した素材や、素材探しの時によく使うサイトを見ることができる。いつか自作素材の購入機能をつくろうかしら。"
  end

  def show
    # 説明内容を機能紹介ページでも使用するため、indexメソッドを使用する
    index
  end
end
