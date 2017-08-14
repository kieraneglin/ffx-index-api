json.set! :response, response.status
json.set! :data do
  json.array! @results do |result|
    json.name result[0]
    json.id result[1]
    json.slug result[2]
    json.type result[3]
    json.link result[4]

    if result[3] == 'monster'
      monster = Monster.find(result[1])
      search_metrics = "#{result[0]} #{result[2]} "
      search_metrics += "#{monster.locations.map(&:name).join(' ')} "
      search_metrics += "#{monster.kill_dropped_items.map(&:name).join(' ')} "
      search_metrics += "#{monster.steal_dropped_items.map(&:name).join(' ')} "
      search_metrics += "#{monster.drop_abilities.map(&:name).join(' ')} "
    end

    if result[3] == 'item'
      item = Item.find(result[1])
      search_metrics = "#{result[0]} #{result[2]} "
      search_metrics += "#{item.abilities.map(&:name).join(' ')} "
      search_metrics += "#{item.get_mixes.map(&:mix).map(&:name).join(' ')} "
    end

    if result[3] == 'ability'
      ability = Ability.find(result[1])
      search_metrics = "#{result[0]} #{result[2]} "
      search_metrics += "#{ability.effect} "
    end

    json.search_metrics search_metrics || nil
  end
end
