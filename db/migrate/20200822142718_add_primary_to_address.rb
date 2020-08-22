# frozen_string_literal: true

class AddPrimaryToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :primary, :boolean, default: false
  end
end
