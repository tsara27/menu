FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    stock { Faker::Number.between(from: 1, to: 55) }
  end
end
