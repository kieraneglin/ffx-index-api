class AddSlugToKeyItems < ActiveRecord::Migration[5.0]
  def change
    add_column :key_items, :slug, :string
  end
end
