module HasHexID
  extend ActiveSupport::Concern

  included do
    before_create :create_unique_hex_id
  end

  def create_unique_hex_id
    hex_id = SecureRandom.hex 5
    while self.class.exists?(hex_id: hex_id)
      hex_id = SecureRandom.hex 5
    end
    self.hex_id = hex_id
  end
end