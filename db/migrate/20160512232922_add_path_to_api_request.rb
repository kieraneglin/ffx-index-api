class AddPathToApiRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :api_requests, :url_path, :string
  end
end
