class StickmanWarCharacterSpecial < ActiveHash::Base
  self.data = [
    # 今後 ステータス比較 というような形で情報を引っ張り出すとき、picture_nameを使う予定なので基本的に変更しない
    {id: 1 , character_name: "素手" , picture_name: "Punch"       , life: 40 , power: 5 , attack_cool_time: 3 ,    knockback_times: 4 , cost: 30 , hp_rate: 1.5 ,  attack_rate:2 ,    move_speed: 70 , attack_type: "単体" , main_work: "前線火力"},
    {id: 2 , character_name: "小盾" , picture_name: "SmallShield" , life: 150 , power: 7, attack_cool_time: 10 ,   knockback_times: 3 , cost: 80 , hp_rate: 3 ,    attack_rate:1.5 ,  move_speed: 50 , attack_type: "単体", main_work: "前線維持"},
    {id: 3 , character_name: "小弓" , picture_name: "SmallArcher" , life: 60 , power: 15 , attack_cool_time: 3,    knockback_times: 6 , cost: 120 , hp_rate: 1.2 , attack_rate:3 ,    move_speed: 40 , attack_type: "単体", main_work: "後方火力"},
    {id: 4 , character_name: "短木" , picture_name: "Wood"        , life: 80 , power: 13 , attack_cool_time: 2.5,  knockback_times: 4 , cost: 150 , hp_rate: 2 ,   attack_rate:2.5 ,  move_speed: 50 , attack_type: "単体", main_work: "前線火力"},
    {id: 5 , character_name: "バット" , picture_name: "Bat"       , life: 90 , power: 30 , attack_cool_time: 5.5,  knockback_times: 4 , cost: 200 , hp_rate: 2.5 , attack_rate:2.5 ,  move_speed: 90 , attack_type: "単体", main_work: "前線火力"},
    {id: 6 , character_name: "剣" , picture_name: "LightSword"   , life: 200 , power: 20 , attack_cool_time: 2.5, knockback_times: 5 , cost: 250 , hp_rate: 2.5 , attack_rate:3 ,    move_speed: 90 , attack_type: "貫通", main_work: "前線火力"},
    {id: 7 , character_name: "重剣" , picture_name: "HeavySword" , life: 280 , power: 32 , attack_cool_time: 5,   knockback_times: 4 , cost: 500 , hp_rate: 3 ,   attack_rate:5 ,    move_speed: 90 , attack_type: "範囲", main_work: "前線火力"},
    {id: 8 , character_name: "大弓" , picture_name: "BigArcher"  , life: 120 , power: 30 , attack_cool_time: 8,   knockback_times: 3 , cost: 600 , hp_rate: 1.2 , attack_rate:7 ,    move_speed: 40 , attack_type: "貫通", main_work: "後方火力"},
    {id: 9 , character_name: "双剣" , picture_name: "TwinSword"  , life: 180 , power: 35 , attack_cool_time: 3,   knockback_times: 4 , cost: 900 , hp_rate: 1.2 , attack_rate:8 ,    move_speed: 120 , attack_type: "単体", main_work: "奇襲"},
    {id: 10, character_name: "バズーカ" , picture_name: "Bazooka" , life: 130 , power: 80 , attack_cool_time: 10,  knockback_times: 6 , cost: 1300 , hp_rate: 1.2, attack_rate:6 ,    move_speed: 40 , attack_type: "特殊", main_work: "後方火力"},
    {id: 11, character_name: "大盾" , picture_name: "BigShield"  , life: 980 , power: 12 , attack_cool_time: 7.5, knockback_times: 3 , cost: 900 , hp_rate: 12   , attack_rate:1.5 ,  move_speed: 40 , attack_type: "範囲", main_work: "前線維持"},
    {id: 12, character_name: "ビーム" , picture_name: "Beam"     , life: 140 , power: 80 , attack_cool_time: 12,  knockback_times: 4 , cost: 1900 , hp_rate: 1.2 , attack_rate:6    , move_speed: 40 , attack_type: "範囲", main_work: "後方火力"}
  ]

end