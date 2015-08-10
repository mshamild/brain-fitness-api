FactoryGirl.define do
  factory :category do
    title { Faker::Lorem.word }
    color { rand(2**24 - 1).to_s(16) }

    trait :with_questions do
      after(:create) do |category|
        create_list :question, 18, category: category
      end
    end
  end
end
