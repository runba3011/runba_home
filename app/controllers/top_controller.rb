class TopController < ApplicationController
  def index
    @stickman_war_explain = "棒人間たちのタワーディフェンスゲーム！ルンバ氏が なんか盾持ってるキャラいるけどそれ使わないんだ と某漫画戦争をやっている時に考え、 文句をつけるなら自分で作ろうじゃないか と謎行動力を発揮した結果生まれた作品。ステージやキャラクターを追加実装予定！"
    @movie_explain = "ルンバ氏の持ちうる最大規模のコンテンツ。2019年5月から始まった。その時期に投稿された動画はことごとく限定公開になっている。とある場所から見れるようになっているので探してみよう。"
    @group_explain = "「それTwitterでよくね」「それDiscordで良くね」そういうことを言われると非常に悲しい気持ちになります。"
    @request_explain = "ルンバ氏に対して直接リクエストを送ることができます。「それYouTubeで良くね」「それTwitterで良くね」とか言われると悲しい気持ちになります。頑張って作ったから使って"
    @programing_explain = "ルンバ氏がプログラミングを学ぶ中で「こういうミスをしたよ」「こういうところでつまづいたよ」というのをまとめたところになります。普段のテンションでまとめてるのでプログラミングに興味のない人も見ていってください。"
    
  end

  def show
    
  end
end
