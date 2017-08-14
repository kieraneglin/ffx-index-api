class CreateLocationsMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :locations_monsters do |t|
      t.references :location, foreign_key: true
      t.references :monster, foreign_key: true
    end
  end
end
