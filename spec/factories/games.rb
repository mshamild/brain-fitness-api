FactoryGirl.define do
  factory :game do
    trait :with_round do
      # rounds { build_list :round, Game::ROUNDS_COUNT }
    end
  end
end
