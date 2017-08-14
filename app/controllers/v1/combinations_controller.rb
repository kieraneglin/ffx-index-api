class V1::CombinationsController < ApplicationController
  def index
    # TODO: Make.... less terrible
    monster = Monster.all.map {|r| [r.name, r.id, r.slug, 'monster', "#{v1_one_monster_path(r.slug)}"]}
    item = Item.all.map {|r| [r.name, r.id, r.slug, 'item', "#{v1_one_item_path(r.slug)}"]}
    ability = Ability.all.map {|r| [r.name, r.id, r.slug, 'ability', "#{v1_one_ability_path(r.slug)}"]}
    location = Location.all.map {|r| [r.name, r.id, r.slug, 'location', "#{v1_one_location_path(r.slug)}"]}
    mix = Mix.all.map {|r| [r.name, r.id, r.slug, 'mix', "#{v1_one_mix_path(r.slug)}"]}
    keyitem = KeyItem.all.map {|r| [r.name, r.id, r.slug, 'keyitem', "#{v1_one_key_item_path(r.slug)}"]}

    @results = monster + item + ability + location + mix + keyitem
    @results.sort!
  end
end
