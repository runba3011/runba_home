class MaterialsController < ApplicationController
  def index
    @icon_public_domain_q = "materials/icon/public_domain_q.png"
    @type_public_domain_q = "実写画像、イラスト"
    @icon_mascle_plus = "materials/icon/mascle_plus.png"
    @type_mascle_plus = "マッチョたちの実写画像"
    @icon_topecon_heroes = "materials/icon/topecon_heroes.png"
    @type_topecon_heroes = "アイコン、ピクトグラムなど様々な画像"
    @icon_nanasan_yuki = "materials/icon/nanasan_yuki.png"
    @type_nanasan_yuki = "イラスト"
    @icon_texture_ninja = "materials/icon/texture_ninja.png"
    @type_texture_ninja = "実写画像、リアルなイラスト"
    @icon_beiz_images = "materials/icon/beiz_images.png"
    @type_beiz_images = "実写画像"
    @icon_irasutoya = "materials/icon/irasutoya.png"
    @type_irasutoya = "ポップなイラスト"
  end

  def show
    index
  end

  def new

  end

  def create
    
  end
end
