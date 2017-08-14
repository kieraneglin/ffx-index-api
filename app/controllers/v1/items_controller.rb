class V1::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.preload(preload_hash).find_by_id_or_slug(params[:id])
  end

  def items_with_monsters
    @items = Item.preload(preload_hash).all
  end

  private

  def preload_hash
    [
      kill_drops: [ :monster ],
      steal_drops: [ :monster ],
      bribe_drops: [ :monster ]
    ]
  end
end
