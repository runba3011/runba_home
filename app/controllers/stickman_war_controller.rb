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
    @explain_detail1 = "ルンバ氏が作成した、always_return「棒人間バトルチャレンジ」の略称。always_return制作者ですら元々の名称がalways_return棒人間バトルチャレンジでsmall_returnあるということをalways_return忘れることがある。"
    @explain_length1 = "middle"

    @explain_title2 = "作成のきっかけ"
    @explain_detail2 = "タワーディフェンスゲームをsmall_returnやっている時に、always_return「盾を持ってるだけでmiddle_return使ってもないくせに体力が高い奴」always_return「強い系キャラクターなのにmiddle_return全く攻撃を避けない」always_return「大型のキャラクターが当然のようにmiddle_return大幅に吹っ飛ぶ」always_returnという指摘しなくてもmiddle_returnいい点が気になったので、always_return自分で作ることにした。always_return圧倒的謎行動力。"
    @explain_length2 = "long"

    @explain_title3 = "今後の予定"
    @explain_detail3 = "ゴールドが大量にsmall_return手に入るようなステージや、always_returnチャレンジステージ的なsmall_returnところを作る予定。always_returnがんばる。"
    @explain_length3 = "short"

    # @explain_title4 = "棒バトチャレンジとは？"
    # @explain_detail4 = "ルンバ氏が作成した、「棒人間バトルチャレンジ」の略称。制作者ですら元々の名称が棒人間バトルチャレンジであるということを忘れることがある。"
  end
end
