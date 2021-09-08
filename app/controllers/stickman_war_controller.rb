class StickmanWarController < ApplicationController
  def show
    render "stickman_war/#{params[:id]}"
  end

  def index
    @explain_title1 = "棒バトチャレンジとは？"
    @explain_detail1 = "ルンバ氏が作成した、「棒人間バトルチャレンジ」の略称。制作者ですら元々の名称が棒人間バトルチャレンジであるということを忘れることがある。"
    
    @explain_title2 = "作成のきっかけ"
    @explain_detail2 = "タワーディフェンスゲームをやっている時に、\n「盾を持ってるだけで使ってもないくせに体力が高い奴」「強い系キャラクターなのに多少たりとも攻撃を避けない」「大型のキャラクターが当然のように大幅に吹っ飛ぶ」という指摘しなくてもいい点が気になったので、自分で作ることにした。圧倒的謎行動力。"

    @explain_title3 = "今後の予定"
    @explain_detail3 = "ゴールドが大量に手に入るようなステージや、チャレンジステージ的なところを作る予定。がんばる。"

    # @explain_title4 = "棒バトチャレンジとは？"
    # @explain_detail4 = "ルンバ氏が作成した、「棒人間バトルチャレンジ」の略称。制作者ですら元々の名称が棒人間バトルチャレンジであるということを忘れることがある。"

    
  end
end
