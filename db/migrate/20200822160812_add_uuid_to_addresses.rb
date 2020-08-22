# frozen_string_literal: true

class AddUuidToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :uuid, :string
    add_index :addresses, :uuid, unique: true
  end
end
