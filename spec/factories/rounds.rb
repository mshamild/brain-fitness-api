FactoryGirl.define do
  factory :round do
    round_categories { build_list :round_category, Round::CATEGORIES_COUNT }
  end
end
