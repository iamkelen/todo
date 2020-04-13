FactoryBot.define do
  factory :task do
    title { 'My task' }
    date { Date.tomorrow }
  end
end
