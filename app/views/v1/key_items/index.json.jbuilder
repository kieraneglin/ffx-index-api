json.set! :response, response.status
json.set! :data do
  json.array! @key_items do |item|
    json.name item.name

    if item.location
      json.location item.location.name
    else
      json.location nil
    end

    json.description item.description
    json.details item.details

    json.api_details do
      json.item do
        json.id item.id
        json.slug item.slug
      end

      if item.location
        json.location do
          json.id item.location.id
          json.slug item.location.slug
        end
      else
        json.location nil
      end
    end
  end
end
