FactoryGirl.define do
  factory :question do
    category

    text { Faker::Lorem.paragraph }
    answer_variants { build_list :answer_variant, 4 }
  end
end
