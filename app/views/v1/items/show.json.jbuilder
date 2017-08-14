json.set! :response, response.status
json.set! :data do
  json.name @item.name
  json.effect @item.effect
  json.effect_type @item.effect_type

  json.api_details do
    json.id @item.id
    json.slug @item.slug
  end

  json.set! :mixes do
    json.array! @item.get_mixes do |mix_item|
      json.name mix_item.mix.name
      json.id mix_item.mix.id
      json.slug mix_item.mix.slug
    end
  end

  if @item.abilities.present?
    json.set! :abilities do
      json.array! @item.abilities do |ability|
        json.name ability.name
        json.ability_type ability.ability_type
        json.effect ability.effect
        json.amount_needed ability.item_amount

        json.api_details do
          json.id ability.id
          json.slug ability.slug
        end
      end
    end
  else
    json.abilities nil
  end

  if @item.bribe_drops.present?
    json.set! :bribe_drops do
      json.array! @item.bribe_drops do |bribe_drop|
        json.amount bribe_drop.amount
        json.cost bribe_drop.cost
        json.name bribe_drop.monster.name

        json.api_details do
          json.id bribe_drop.monster.id
          json.slug bribe_drop.monster.slug
        end
      end
    end
  else
    json.bribe_drops nil
  end

  if @item.kill_drops.present?
      json.kill_drops @item.kill_drops do |kill_drop|
        json.amount kill_drop.amount
        json.name kill_drop.monster.name
        json.rare kill_drop.rare

        json.api_details do
            json.id kill_drop.monster.id
            json.slug kill_drop.monster.slug
        end
    end
  else
    json.kill_drops nil
  end

  if @item.steal_drops.present?
    json.set! :steal_drops do
      json.array! @item.steal_drops do |steal_drop|
        json.amount steal_drop.amount
        json.name steal_drop.monster.name
        json.rare steal_drop.rare

        json.api_details do
          json.monster do
            json.id steal_drop.monster.id
            json.slug steal_drop.monster.slug
          end
        end
      end
    end
  else
    json.steal_drop nil
  end
end
