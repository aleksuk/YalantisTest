class User < ActiveRecord::Base
  has_many :images, dependent: :destroy

  before_create :generate_access_key

  private
    def generate_access_key
      self.key = SecureRandom.hex
    end
end
