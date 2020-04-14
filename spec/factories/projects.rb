FactoryBot.define do
  factory :project do
    title { FFaker::HipsterIpsum.sentence }
    user
  end
end
