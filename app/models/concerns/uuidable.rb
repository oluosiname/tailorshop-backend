# frozen_string_literal: true

module Uuidable
  extend ActiveSupport::Concern

  included do
    before_create :set_uuid
  end

  class_methods do
    def u_find(uuid)
      find_by(uuid: uuid)
    end
  end

  private

  def set_uuid
    self.uuid = generate_uuid
  end

  def generate_uuid
    loop do
      random_uuid = SecureRandom.base36(16).upcase
      break random_uuid unless self.class.exists?(uuid: random_uuid)
    end
  end
end
