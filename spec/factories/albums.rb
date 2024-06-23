require 'factory_bot'

FactoryBot.define do
  factory :album do
    artist_id { 1 }
    title { "Foo Fighters" }
    release_date { "2014-07-20" }
    artist { "Foo Fighters" }
  end
end
