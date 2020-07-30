# frozen_string_literal: true

class AddMoreFieldsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :phone_number, :string
  end
end
