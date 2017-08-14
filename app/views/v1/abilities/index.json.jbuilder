json.set! :response, response.status
json.set! :data do
  json.array! @abilities do |ability|
    json.name ability.name
    json.ability_type ability.ability_type
    json.effect ability.effect

    json.api_details do
      json.id ability.id
      json.slug ability.slug
    end

    if ability.item
      json.item do
        json.name ability.item.name
        json.amount ability.item_amount

        json.api_details do
          json.id ability.item.id
          json.slug ability.item.slug
        end
      end
    else
      json.item nil
    end
  end
end
