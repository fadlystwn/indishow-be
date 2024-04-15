FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "johndoe@example.com" }
    password_digest { "password123!" }
    phone_number { "+6281234567" }
  end
end
