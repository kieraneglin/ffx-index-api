json.set! :response, response.status
json.set! :data do

  json.name @ability.name
  json.ability_type @ability.ability_type
  json.effect @ability.effect

  json.api_details do
    json.id @ability.id
    json.slug @ability.slug
  end

  if @ability.monster_drop_abilities.any?
    json.monster_drops @ability.monster_drop_abilities do |drop|
      json.name drop.monster.name
      json.id drop.monster.id
      json.slug drop.monster.slug
    end
  end

  if @ability.item
    json.item do
      json.name @ability.item.name
      json.item_amount @ability.item_amount

      json.api_details do
        json.id @ability.item.id
        json.slug @ability.item.slug
      end
    end
  else
    json.item nil
  end
end
