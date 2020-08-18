# frozen_string_literal: true

module Uuidable
  extend ActiveSupport::Concern

  included do
    before_create :set_uuid
  end

  def ufind(uuid)
    self.class.find_by(uuid: uuid)
  end

  private

  def set_uuid
    self.uuid = generate_uuid
  end

  def generate_uuid
    loop do
      random_uuid = SecureRandom.base36(16)
      break random_uuid unless self.class.exists?(uuid: random_uuid)
    end
  end
end
