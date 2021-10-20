class MaterialsController < ApplicationController
  def index
    @icon_public_domain_q = "materials/icon/public_domain_q.png"
    @icon_mascle_plus = "materials/icon/mascle_plus.png"
    @icon_topecon_heroes = "materials/icon/topecon_heroes.png"
    @icon_nanasan_yuki = "materials/icon/nanasan_yuki.png"
    @icon_texture_ninja = "materials/icon/texture_ninja.png"
    @icon_beiz_images = "materials/icon/beiz_images.png"
    @icon_irasutoya = "materials/icon/irasutoya.png"
  end

  def show
    index
  end

  def new

  end

  def create
    
  end
end
