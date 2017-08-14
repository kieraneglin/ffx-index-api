json.set! :response, response.status
json.set! :data do
  json.array! @monsters do |monster|
    json.name monster.name
    
    json.api_details do
      json.id monster.id
      json.slug monster.slug
    end
  end
end
