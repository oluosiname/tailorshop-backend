class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :token
      t.datetime :confirmed_at
      t.timestamps
    end
  end
end
