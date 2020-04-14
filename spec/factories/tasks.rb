FactoryBot.define do
  factory :task do
    title { FFaker::HipsterIpsum.word }
    date { Date.tomorrow }
    project
  end
end
