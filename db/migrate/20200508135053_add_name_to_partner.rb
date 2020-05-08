# frozen_string_literal: true

class AddNameToPartner < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :name, :string, null: false
    add_index :partners, :name, unique: true
  end
end
