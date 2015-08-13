RSpec::Matchers.define :be_a_round_category_representation do |round_category|
  match do |json|
    response_attributes = round_category.sliced_attributes %w(
      id
      created_at
      updated_at
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)

    expect(json['category']).to be_a_category_short_representation(round_category.category)

    expect(json['round_questions'].count).to eq 3

    round_category.round_questions.zip(json['round_questions']).each.map do |round_question, question_json|
      expect(question_json).to be_a_round_question_representation(round_question)
    end
  end
end
