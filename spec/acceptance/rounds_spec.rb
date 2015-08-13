require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Rounds' do
  subject(:json_response) { json_response_body }
  let(:users) { create_list :user, 2 }
  let(:current_user) { users.first }
  let(:auth_token) { current_user.authentication_token }

  let(:game) { create :game, users: users }
  let(:round) { game.rounds.first }
  let(:selected_category) { round.round_categories.first }
  let(:question_1) { selected_category.round_questions[0] }
  let(:question_2) { selected_category.round_questions[1] }
  let(:question_3) { selected_category.round_questions[2] }
  let(:answer_variant_id) { question_1.question.answer_variants.first.id }

  let(:game_id) { game.id }
  let(:round_id) { round.id }

  put '/v1/games/:game_id/rounds/:round_id' do
    parameter :auth_token, required: true
    parameter :round_categories_attributes, 'Round Categories', scope: :round

    let(:round_categories_attributes) do
      [
        {
          id: selected_category.id,
          selected: true,
          round_questions_attributes: [
            { id: question_1.id,
              answers_attributes: [ { answer_variant_id: answer_variant_id } ] },
            { id: question_2.id,
              answers_attributes: [ { answer_variant_id: answer_variant_id } ] },
            { id: question_3.id,
              answers_attributes: [ { answer_variant_id: answer_variant_id } ] }
          ]
        }
      ]
    end

    example_request 'creates answers for current_user' do
      expect(question_1.answers.first.answer_variant_id).to eq answer_variant_id
      expect(question_1.answers.first.user_id).to eq current_user.id

      expect(question_1.answers.first.answer_variant_id).to eq answer_variant_id
      expect(question_1.answers.first.user_id).to eq current_user.id

      expect(question_1.answers.first.answer_variant_id).to eq answer_variant_id
      expect(question_1.answers.first.user_id).to eq current_user.id
    end
  end
end
