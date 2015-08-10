FactoryGirl.define do
  factory :round_category, class: 'RoundCategory' do
    category { create :category, :with_questions }
    round_questions { build_list :round_question, 3 }
  end
end
