class V1::KeyItemsController < ApplicationController
  def index
    @key_items = KeyItem.all
  end

  def show
    @item = KeyItem.preload(:key_items).find_by_id_or_slug(params[:id])
  end
end
