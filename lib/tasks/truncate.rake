namespace :database do
  task truncate: :environment do
    puts "Destroying Monsters"
    Monster.destroy_all
    puts "Done. Destroying Items"
    Item.destroy_all
    puts "Done. Destroying Locations"
    Location.destroy_all
    puts "Done. Destroying Abilities"
    Ability.destroy_all
    puts "Done. Destroying Mixes"
    Mix.destroy_all
    puts "Done. Destroying MixItems"
    MixItem.destroy_all
  end
end
