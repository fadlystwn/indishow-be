require 'factory_bot'

FactoryBot.define do
  factory :album do
    title { "Foo Fighters" }
    release_date { "20 Juli 2014" }
    artist { "Foo Fighters" }
  end
end
