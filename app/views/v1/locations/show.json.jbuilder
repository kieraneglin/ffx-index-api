json.set! :response, response.status
json.set! :data do
  json.name @location.name

  json.api_details do
    json.id @location.id
    json.slug @location.slug
  end

  json.set! :monsters do
    json.array! @location.monsters do |monster|
      json.name monster.name
      json.api_details do
        json.id monster.id
        json.slug monster.slug
      end
    end
  end

  json.set! :key_items do
    json.array! @location.key_items do |item|
      json.name item.name
      json.description item.description
      json.api_details do
        json.id item.id
        json.slug item.slug
      end
    end
  end
end
