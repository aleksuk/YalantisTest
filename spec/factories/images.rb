FactoryGirl.define do
  factory :image do
    height 1
    width 1
    picture do
      Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'Ruby_on_Rails-logo.png'))
    end
    user nil
  end
end
