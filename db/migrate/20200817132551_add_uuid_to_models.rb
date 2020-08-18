class AddUuidToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :uuid, :string
    add_column :users, :uuid, :string
    add_column :partners, :uuid, :string

    add_index :customers, :uuid, unique: true
    add_index :users, :uuid, unique: true
    add_index :partners, :uuid, unique: true
  end
end
