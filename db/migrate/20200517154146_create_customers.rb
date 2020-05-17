# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true, index: true
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
