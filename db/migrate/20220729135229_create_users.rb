class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.boolean :admin_user, default: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
