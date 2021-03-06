class StickmanWarController < ApplicationController
  def show
    if params[:id] == "basic"
      
    elsif params[:id] == "challenge"

    elsif params[:id] == "bonus"

    end

    render "stickman_war/#{params[:id]}"
  end

  def index
    @explain_title1 = "棒バトチャレンジとは？"
    @explain_detail1 = "ルンバ氏が作成したゲームアプリ。実はルンバ氏、スティックマンアニメーションをかなり長い間書いておりまして、それを使って何か作ってみようかなと考えていたんですね。ところで、「スティックマンアニメーション」っていうとなんだかすごい感じに聞こえて草ですね。棒人間バトルなんですけども。"

    @explain_title2 = "作成のきっかけ"
    @explain_detail2 = "タワーディフェンスゲームをやっている時に、「盾を持ってるだけで使ってもないくせに体力が高い奴」「強い系キャラクターなのに全く攻撃を避けない」「大型のキャラクターが当然のように大幅に吹っ飛ぶ」という指摘しなくてもいい点が気になったので、自分で作ることにした。圧倒的謎行動力。"

    @explain_title3 = "今後の予定"
    @explain_detail3 = "ゴールドが大量に手に入るようなステージや、チャレンジステージ的なところを作る予定。そう言えばですけどもこのページの中に「チャレンジステージ」「ボーナスステージ」というリンクがありますけれども、棒バトチャレンジの方で作ってすらいないのでそのリンクはまだ使えません。押してもページが移動しないのは仕様です。"

    # @explain_title4 = "棒バトチャレンジとは？"
    # @explain_detail4 = "ルンバ氏が作成した、「棒人間バトルチャレンジ」の略称。制作者ですら元々の名称が棒人間バトルチャレンジであるということを忘れることがある。"
  end
end
