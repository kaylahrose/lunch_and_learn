FactoryBot.define do
  factory :favorite do
    recipe_title { "MyString" }
    recipe_link { "MyString" }
    country { "MyString" }
    user { nil }
  end
end
