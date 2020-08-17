# frozen_string_literal: true

class SetupCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_reference :customers, :user, index: true
    add_reference :customers, :partner, index: true, foreign_key: true
  end
end
