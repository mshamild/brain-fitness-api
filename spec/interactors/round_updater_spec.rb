require 'rails_helper'

describe RoundUpdater do
  let(:user) { create :user }
  let(:game) { create :game }
  let(:round) { game.rounds.first }
  let(:selected_category) { round.round_categories.first }
  let(:question_1) { selected_category.round_questions[0] }
  let(:question_2) { selected_category.round_questions[1] }
  let(:question_3) { selected_category.round_questions[2] }
  let(:answer_variant_id) { question_1.question.answer_variants.first.id }

  let(:attributes) do
    {
      round_categories_attributes: [
        {
          id: selected_category.id,
          selected: true,
          round_questions_attributes: [
            {
              id: question_1.id,
              answers_attributes: [ { answer_variant_id: answer_variant_id } ]
            },
            {
              id: question_2.id,
              answers_attributes: [ { answer_variant_id: answer_variant_id } ]
            },
            {
              id: question_3.id,
              answers_attributes: [ { answer_variant_id: answer_variant_id } ]
             }
          ]
        }
      ]
    }
  end

  before do
    described_class.call(user: user, round: round, attributes: attributes)
  end

  it 'creates new answer for user' do
    expect(question_1.answers.first.answer_variant_id).to eq answer_variant_id
    expect(question_1.answers.first.user_id).to eq user.id

    expect(question_1.answers.first.answer_variant_id).to eq answer_variant_id
    expect(question_1.answers.first.user_id).to eq user.id

    expect(question_1.answers.first.answer_variant_id).to eq answer_variant_id
    expect(question_1.answers.first.user_id).to eq user.id
  end
end
