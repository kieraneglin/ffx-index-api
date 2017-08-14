class V1::AbilitiesController < ApplicationController
  def index
    @abilities = Ability.preload(:item).order(:name).all
  end

  def show
    @ability = Ability.preload(monster_drop_abilities: :monster).find_by_id_or_slug(params[:id])
  end
end
