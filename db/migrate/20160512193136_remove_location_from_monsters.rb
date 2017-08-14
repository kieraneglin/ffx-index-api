class RemoveLocationFromMonsters < ActiveRecord::Migration[5.0]
  def change
    remove_reference :monsters, :location
  end
end
