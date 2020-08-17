# frozen_string_literal: true

class AddMoreFieldsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :phone_number, :string
    add_column :customers, :gender, :string
  end
end
