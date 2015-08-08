FactoryGirl.define do
  factory :game do
    rounds { build_list :round, Game::ROUNDS }
  end
end
