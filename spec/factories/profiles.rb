FactoryBot.define do
  factory :profile do
    band_name { "MyString" }
    bio { "MyText" }
    user { nil }
  end
end
