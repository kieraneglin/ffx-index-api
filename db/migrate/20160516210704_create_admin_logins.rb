class CreateAdminLogins < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_logins do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
