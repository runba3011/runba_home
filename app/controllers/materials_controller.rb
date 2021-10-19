class MaterialsController < ApplicationController
  def index
    @icon_public_domain_q = "materials/icon/public_domain_q.png"
    @icon_mascle_plus = "materials/icon/mascle_plus.png"
    @icon_topecon_heroes = "materials/icon/topecon_heroes.png"
  end

  def show
    index
  end

  def new

  end

  def create
    
  end
end
