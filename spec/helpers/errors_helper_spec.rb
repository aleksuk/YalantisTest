require 'rails_helper'

RSpec.describe ErrorsHelper, type: :helper do
  describe "#generate_errors" do
    it "should create active record objec with error" do
      error_message = 'expired'

      errors = helper.generate_errors(User, { session: error_message })

      expect(errors[:session].size).to be(1)
      expect(errors[:session].first).to eq(error_message)
    end
  end
end
