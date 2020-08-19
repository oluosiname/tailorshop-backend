# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
